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
    s = {
      description = 'Standup',
      template = '* Connection Standup :%(return string.upper(os.date("%b%Y"))):CONNECTIONS:\n'..
                 '%U\n\n'..
                 '** Attendees\n'..
                 '- Joe Lissner\n'..
                 '- Seth Johnson\n'..
                 '- David Quinonez\n'..
                 '- Karen Gomez\n'..
                 '- Fred Luetkemeier\n\n'..
                 '** Updates\n'..
                 '*** Joe\n\n'..
                 '*** Seth\n\n'..
                 '*** David\n\n'..
                 '*** Karen\n\n'..
                 '*** Fred\n\n'..
                 '** Word of the Day :WORD_OF_THE_DAY:SPANISH:\n'..
                 '*** ??: \n\n'..
                 '** Action Items\n'..
                 '*** TODO\n',
      target = '~/notes/journal/%<%Y-%m-%d>.org',
      properties = {
        empty_lines = {
        }
      },
    },
    m = {
      description = 'Meeting',
      template = '* %? :%(return string.upper(os.date("%b%Y"))):\n'..
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
