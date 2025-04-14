-- Autopairs
-- Before        Input                    After         Note
-- -----------------------------------------------------------------
-- (|foobar      <M-e> then press $       (|foobar)
-- (|)(foobar)   <M-e> then press q       (|(foobar))
-- (|foo bar     <M-e> then press qh      (|foo) bar
-- (|foo bar     <M-e> then press qH      (foo|) bar
-- (|foo bar     <M-e> then press qH      (foo)| bar    if cursor_pos_before = false
return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  opts = {},
}
