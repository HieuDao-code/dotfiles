# Auto-activate python `.venv` virtual environments
if [[ ! $DISABLE_VENV_CD -eq 1 ]]; then
  function auto_source_venv {
    if [[ -z "$VENV_AUTO_ACTIVATED" ]]; then
      local VENV_AUTO_ACTIVATED=1
      local PROJECT_ROOT="${PWD:A}"

      # Get absolute path, resolving symlinks
      while [[ "$PROJECT_ROOT" != "/" && ! -d "$PROJECT_ROOT/.venv" && ! -d "$PROJECT_ROOT/.git" ]]; do
        PROJECT_ROOT="${PROJECT_ROOT:h}"
      done

      # We've just left the repo, deactivate the environment
      # Note: this only happens if the virtualenv was activated automatically
      if [[ -n "$VENV_PATH" && "$PROJECT_ROOT/.venv" != "$VENV_PATH" ]]; then
        if [[ -n "$VIRTUAL_ENV" ]]; then
          # Only deactivate if VIRTUAL_ENV was set
          # User may have deactivated manually or via another mechanism
          deactivate
        fi
      fi

      # Activate the environment only if it is not already active
      if [[ -e "$PROJECT_ROOT/.venv/bin/activate" ]]; then
        if [[ "$VIRTUAL_ENV" != "$PROJECT_ROOT/.venv" ]]; then
          source "$PROJECT_ROOT/.venv/bin/activate"
          export VENV_PATH="$PROJECT_ROOT/.venv"
        fi
      fi
    fi
  }

  # Append workon_cwd to the chpwd_functions array, so it will be called on cd
  # http://zsh.sourceforge.net/Doc/Release/Functions.html
  autoload -U add-zsh-hook
  add-zsh-hook chpwd auto_source_venv
  [[ $PWD != ~ ]] && auto_source_venv
fi

