-- Use linter for which there is no LSP support

-- trivy check for vulnerabilities
local severity_map = {
  ['LOW'] = vim.diagnostic.severity.INFO,
  ['MEDIUM'] = vim.diagnostic.severity.WARN,
  ['HIGH'] = vim.diagnostic.severity.ERROR,
  ['CRITICAL'] = vim.diagnostic.severity.ERROR,
}

-- Find code line of package_name for diagnostics
function find_package_line(package_name, version, filename)
  local file = io.open(filename, 'r')
  local lineno = 0
  for line in file:lines() do
    lineno = lineno + 1
    local pattern = '^%s*' .. package_name .. '%s*[=><~!]*%s*' .. version
    if line:match(pattern) then
      file:close()
      return lineno
    end
  end
end

return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require 'lint'

    -- Trivy vulnerabilities scanner
    lint.linters.trivy_vuln = {
      cmd = 'trivy',
      stdin = false,
      append_fname = true,
      args = { 'fs', '--scanners', 'vuln', '--format', 'json' },
      stream = 'stdout',
      ignore_exitcode = false,
      parser = function(output, bufnr)
        local diagnostics = {}

        -- Example output:
        -- {
        --   "Results": [
        --     {
        --       "Target": <file path>,
        --       "Vulnerabilities": [
        --         {
        --           "VulnerabilityID": <ID>,
        --           "PrimaryURL": <Source URL>,
        --           "PkgName" : <Package name>,
        --           "InstalledVersion" : <Version>,
        --           "Title": <Title>,
        --           "Description": <Description>,
        --           "Severity": "<LOW|MEDIUM|HIGH|CRITIAL>",
        --         }
        --      }
        --   ]
        -- }

        local decoded = vim.json.decode(output)

        for _, result in ipairs(decoded and decoded.Results or {}) do
          --
          for _, vulnerabtility in ipairs(result.Vulnerabilities or {}) do
            local id = vulnerabtility.VulnerabilityID or '<No ID>'
            local package_name = vulnerabtility.PkgName
            local installed_version = vulnerabtility.InstalledVersion

            local lineno = find_package_line(package_name, installed_version, result.Target) - 1
            local title = vulnerabtility.Title or '<No Title>'
            local url = vulnerabtility.PrimaryURL or '<No URL>'
            table.insert(diagnostics, {
              source = 'trivy',
              message = string.format('%s: %s', title, url),
              col = 0,
              end_col = 0,
              lnum = lineno,
              end_lnum = lineno,
              code = id,
              severity = severity_map[vulnerabtility.Severity] or vim.diagnostic.severity.WARN,
            })
          end
        end
        return diagnostics
      end,
    }

    lint.linters_by_ft = {
      dockerfile = { 'trivy' },
      json = { 'trivy' },
      python = { 'trivy' },
      requirements = { 'trivy_vuln' },
      terraform = { 'trivy' },
      ['terraform-vars'] = { 'trivy' },
      tf = { 'trivy' },
      toml = { 'trivy' },
      yaml = { 'trivy' },
    }

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = vim.api.nvim_create_augroup('nvim-lint', { clear = true }),
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
