require('orgmode').setup_ts_grammar();
require('orgmode').setup({
  org_agenda_files = {'~/notes/*', '~/notes/**/*'},
  org_default_notes_file = '~/notes/notes.org',
  org_todo_keywords = {
    'TODO(t)',
    'IN_PROGRESS(i)',
    '|',
    'DONE(d)',
    'CANCELED(c)',
    'NOTE(n)',
  },
  org_todo_keyword_faces = {
    IN_PROGRESS = ':foreground pink',
    CANCELED = ':foreground orange', -- overrides builtin color for `TODO` keyword
    NOTE = ':foreground blue',
  },
  org_capture_templates = {
    m = {
      description = 'Meeting',
      template = '* %? :MEETING:%(return string.upper(os.date("%b%Y"))):\n'..
                 '%U\n\n'..
                 '** Attendees\n\n'..
                 '** Agenda\n\n'..
                 '** Action Items',
      target = '~/notes/journal/%<%Y-%m-%d>.org',
      properties = {
        empty_lines = {
          before = 3,
          after = 3,
        }
      },
    },
    f = {
      description = 'Fleeting Note',
      template = '* NOTE %? :%(return string.upper(os.date("%b%Y"))):\n  %u\n'..
                 'SCHEDULED: %t',
      headline = 'Fleeting',
      target = '~/notes/notes.org',
    },
    r = {
      description = 'Reference Note',
      template = '* NOTE %? :%(return string.upper(os.date("%b%Y"))):\n  %u\n'..
                 'SCHEDULED: %t'..
                 '** Ref'..
                 '** Summary',
      headline = 'Reference',
      target = '~/notes/notes.org',
    },
    t = {
      description = 'Task - <leader>oxi & <leader>oxo to clock in and out',
      template = '* TODO %? :%(return string.upper(os.date("%b%Y"))):\n'..
                 'SCHEDULED: %t',
      target = '~/notes/journal/%<%Y-%m-%d>.org',
    },
  },
});
