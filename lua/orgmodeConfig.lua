require('orgmode').setup_ts_grammar();
require('orgmode').setup({
  org_agenda_files = '~/notes/*',
  org_default_notes_file = '~/notes/notes.org',
  org_todo_keywords = { 'TODO(t)', 'NEXT', 'WAITING', '|', 'DONE', 'CANCELED' },
  org_todo_keyword_faces = {
    WAITING = ':foreground blue',
    CANCELED = ':foreground orange', -- overrides builtin color for `TODO` keyword
  }
})
