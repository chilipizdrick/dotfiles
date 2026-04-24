{...}: {
  programs.helix = {
    enable = true;

    settings = {
      editor = {
        bufferline = "multiple";
        color-modes = true;
        completion-timeout = 10;
        cursorline = true;
        # end-of-line-diagnostics = "hint";
        trim-trailing-whitespace = true;
        true-color = true;
        undercurl = true;
        workspace-lsp-roots = [".git" ".jj" ".direnv"];
        line-number = "relative";

        gutters = ["diff" "spacer" "diagnostics" "line-numbers" "spacer"];

        whitespace.tab = "→";
        soft-wrap.enable = true;
        indent-guides.render = true;
        # inline-diagnostics.cursor-line = "warning";

        cursor-shape = {
          insert = "bar";
          normal = "block";
        };

        lsp = {
          display-messages = true;
          display-progress-messages = true;
          # display-inlay-hints = true;
          inlay-hints-length-limit = 30;
        };
      };

      # keys = {
      #   normal = {
      #     "р" = "move_char_left";
      #     "о" = "move_visual_line_down";
      #     "л" = "move_visual_line_up";
      #     "д" = "move_char_right";
      #
      #     "е" = "find_till_char";
      #     "а" = "find_next_char";
      #     "Е" = "till_prev_char";
      #     "А" = "find_prev_char";
      #     "к" = "replace";
      #     "К" = "replace_with_yanked";
      #     "A-ю" = "repeat_last_motion";
      #
      #     "Ё" = "switch_case";
      #     "ё" = "switch_to_lowercase";
      #     "A-ё" = "switch_to_uppercase";
      #
      #     home = "goto_line_start";
      #     end = "goto_line_end";
      #
      #     "ц" = "move_next_word_start";
      #     "и" = "move_prev_word_start";
      #     "у" = "move_next_word_end";
      #
      #     "Ц" = "move_next_long_word_start";
      #     "И" = "move_prev_long_word_start";
      #     "У" = "move_next_long_word_end";
      #
      #     "м" = "select_mode";
      #     "П" = "goto_line";
      #     "п" = {
      #       "п" = "goto_file_start";
      #       "у" = "goto_last_line";
      #       "а" = "goto_file";
      #       "р" = "goto_line_start";
      #       "д" = "goto_line_end";
      #       "ы" = "goto_first_nonwhitespace";
      #       "в" = "goto_definition";
      #       "В" = "goto_declaration";
      #       "н" = "goto_type_definition";
      #       "к" = "goto_reference";
      #       "ш" = "goto_implementation";
      #       "е" = "goto_window_top";
      #       "с" = "goto_window_center";
      #       "и" = "goto_window_bottom";
      #       "ф" = "goto_last_accessed_file";
      #       "ь" = "goto_last_modified_file";
      #       "т" = "goto_next_buffer";
      #       "з" = "goto_previous_buffer";
      #       "л" = "move_line_up";
      #       "о" = "move_line_down";
      #       "ю" = "goto_last_modification";
      #       "ц" = "goto_word";
      #     };
      #     "Ж" = "command_mode";
      #
      #     "ш" = "insert_mode";
      #     "Ш" = "insert_at_line_start";
      #     "ф" = "append_mode";
      #     "Ф" = "insert_at_line_end";
      #     "щ" = "open_below";
      #     "Щ" = "open_above";
      #
      #     "в" = "delete_selection";
      #     "A-в" = "delete_selection_noyank";
      #     "с" = "change_selection";
      #     "A-с" = "change_selection_noyank";
      #
      #     "С" = "copy_selection_on_next_line";
      #     "A-С" = "copy_selection_on_prev_line";
      #
      #     "ы" = "select_regex";
      #     "A-ы" = "split_selection_on_newline";
      #     "A-_" = "merge_consecutive_selections";
      #     "Ы" = "split_selection";
      #     "ж" = "collapse_selection";
      #     "A-ж" = "flip_selections";
      #     "A-щ" = "expand_selection";
      #     "A-ш" = "shrink_selection";
      #     "A-Ш" = "select_all_children";
      #     "A-з" = "select_prev_sibling";
      #     "A-т" = "select_next_sibling";
      #     "A-у" = "move_parent_node_end";
      #     "A-и" = "move_parent_node_start";
      #     "A-ф" = "select_all_siblings";
      #
      #     "ч" = "extend_line_below";
      #     "Ч" = "extend_to_line_bounds";
      #     "A-ч" = "shrink_to_line_bounds";
      #
      #     "ь" = {
      #       "ь" = "match_brackets";
      #       "ы" = "surround_add";
      #       "к" = "surround_replace";
      #       "в" = "surround_delete";
      #       "ф" = "select_textobject_around";
      #       "ш" = "select_textobject_inner";
      #     };
      #     "х" = {
      #       "в" = "goto_prev_diag";
      #       "В" = "goto_first_diag";
      #       "п" = "goto_prev_change";
      #       "П" = "goto_first_change";
      #       "а" = "goto_prev_function";
      #       "е" = "goto_prev_class";
      #       "ф" = "goto_prev_parameter";
      #       "с" = "goto_prev_comment";
      #       "у" = "goto_prev_entry";
      #       "Е" = "goto_prev_test";
      #       "з" = "goto_prev_paragraph";
      #     };
      #     "ъ" = {
      #       "в" = "goto_next_diag";
      #       "В" = "goto_last_diag";
      #       "п" = "goto_next_change";
      #       "П" = "goto_last_change";
      #       "а" = "goto_next_function";
      #       "е" = "goto_next_class";
      #       "ф" = "goto_next_parameter";
      #       "с" = "goto_next_comment";
      #       "у" = "goto_next_entry";
      #       "Е" = "goto_next_test";
      #       "з" = "goto_next_paragraph";
      #     };
      #
      #     "т" = "search_next";
      #     "Т" = "search_prev";
      #
      #     "г" = "undo";
      #     "Г" = "redo";
      #     "A-г" = "earlier";
      #     "A-Г" = "later";
      #
      #     "н" = "yank";
      #     "з" = "paste_after";
      #     "З" = "paste_before";
      #
      #     "Й" = "record_macro";
      #     "й" = "replay_macro";
      #
      #     "Ю" = "indent";
      #     "Б" = "unindent";
      #     "О" = "join_selections";
      #     "A-О" = "join_selections_space";
      #     "Л" = "keep_selections";
      #     "A-Л" = "remove_selections";
      #
      #     "б" = "keep_primary_selection";
      #     "A-б" = "remove_primary_selection";
      #
      #     "A-Ж" = "ensure_selections_forward";
      #     esc = ["collapse_selection" "keep_primary_selection"];
      #     "C-и" = "page_up";
      #     "C-а" = "page_down";
      #     "C-г" = "page_cursor_half_up";
      #     "C-в" = "page_cursor_half_down";
      #
      #     "C-ц" = {
      #       "C-ц" = "rotate_view";
      #       "ц" = "rotate_view";
      #       "C-ы" = "hsplit";
      #       "ы" = "hsplit";
      #       "C-м" = "vsplit";
      #       "м" = "vsplit";
      #       "C-е" = "transpose_view";
      #       "е" = "transpose_view";
      #       "а" = "goto_file_hsplit";
      #       "А" = "goto_file_vsplit";
      #       "C-й" = "wclose";
      #       "й" = "wclose";
      #       "C-щ" = "wonly";
      #       "щ" = "wonly";
      #       "C-р" = "jump_view_left";
      #       "р" = "jump_view_left";
      #       "C-о" = "jump_view_down";
      #       "о" = "jump_view_down";
      #       "C-л" = "jump_view_up";
      #       "л" = "jump_view_up";
      #       "C-д" = "jump_view_right";
      #       "д" = "jump_view_right";
      #       "Д" = "swap_view_right";
      #       "Л" = "swap_view_up";
      #       "Р" = "swap_view_left";
      #       "О" = "swap_view_down";
      #       "т" = {
      #         "C-ы" = "hsplit_new";
      #         "ы" = "hsplit_new";
      #         "C-м" = "vsplit_new";
      #         "м" = "vsplit_new";
      #       };
      #     };
      #
      #     "C-с" = "toggle_comments";
      #
      #     "C-ш" = "jump_forward";
      #     "C-щ" = "jump_backward";
      #     "C-ы" = "save_selection";
      #
      #     space = {
      #       i = [":toggle lsp.display-inlay-hints"];
      #
      #       "а" = "file_picker";
      #       "А" = "file_picker_in_current_directory";
      #       "у" = "file_explorer";
      #       "ю" = "file_explorer_in_current_buffer_directory";
      #       "и" = "buffer_picker";
      #       "о" = "jumplist_picker";
      #       "ы" = "symbol_picker";
      #       "Ы" = "workspace_symbol_picker";
      #       "в" = "diagnostics_picker";
      #       "В" = "workspace_diagnostics_picker";
      #       "п" = "changed_file_picker";
      #       "ф" = "code_action";
      #       "э" = "last_picker";
      #       "П" = {
      #         "д" = "dap_launch";
      #         "к" = "dap_restart";
      #         "и" = "dap_toggle_breakpoint";
      #         "с" = "dap_continue";
      #         "р" = "dap_pause";
      #         "ш" = "dap_step_in";
      #         "щ" = "dap_step_out";
      #         "т" = "dap_next";
      #         "м" = "dap_variables";
      #         "е" = "dap_terminate";
      #         "C-с" = "dap_edit_condition";
      #         "C-д" = "dap_edit_log";
      #         "ы" = {
      #           "е" = "dap_switch_thread";
      #           "а" = "dap_switch_stack_frame";
      #         };
      #         "у" = "dap_enable_exceptions";
      #         "У" = "dap_disable_exceptions";
      #       };
      #       "ц" = {
      #         "C-ц" = "rotate_view";
      #         "ц" = "rotate_view";
      #         "C-ы" = "hsplit";
      #         "ы" = "hsplit";
      #         "C-м" = "vsplit";
      #         "м" = "vsplit";
      #         "C-е" = "transpose_view";
      #         "е" = "transpose_view";
      #         "а" = "goto_file_hsplit";
      #         "А" = "goto_file_vsplit";
      #         "C-й" = "wclose";
      #         "й" = "wclose";
      #         "C-щ" = "wonly";
      #         "щ" = "wonly";
      #         "C-р" = "jump_view_left";
      #         "р" = "jump_view_left";
      #         "C-о" = "jump_view_down";
      #         "о" = "jump_view_down";
      #         "C-л" = "jump_view_up";
      #         "л" = "jump_view_up";
      #         "C-д" = "jump_view_right";
      #         "д" = "jump_view_right";
      #         "Р" = "swap_view_left";
      #         "О" = "swap_view_down";
      #         "Л" = "swap_view_up";
      #         "Д" = "swap_view_right";
      #         "т" = {
      #           "C-ы" = "hsplit_new";
      #           "ы" = "hsplit_new";
      #           "C-м" = "vsplit_new";
      #           "м" = "vsplit_new";
      #         };
      #       };
      #       "н" = "yank_to_clipboard";
      #       "Н" = "yank_main_selection_to_clipboard";
      #       "з" = "paste_clipboard_after";
      #       "З" = "paste_clipboard_before";
      #       "К" = "replace_selections_with_clipboard";
      #       "л" = "hover";
      #       "к" = "rename_symbol";
      #       "р" = "select_references_to_symbol_under_cursor";
      #       "с" = "toggle_comments";
      #       "С" = "toggle_block_comments";
      #       "A-с" = "toggle_line_comments";
      #     };
      #     "я" = {
      #       "я" = "align_view_center";
      #       "с" = "align_view_center";
      #       "е" = "align_view_top";
      #       "и" = "align_view_bottom";
      #       "ь" = "align_view_middle";
      #       "л" = "scroll_up";
      #       "о" = "scroll_down";
      #       "C-и" = "page_up";
      #       "C-а" = "page_down";
      #       "C-г" = "page_cursor_half_up";
      #       "C-в" = "page_cursor_half_down";
      #
      #       "т" = "search_next";
      #       "Т" = "search_prev";
      #     };
      #     "Я" = {
      #       "я" = "align_view_center";
      #       "с" = "align_view_center";
      #       "е" = "align_view_top";
      #       "и" = "align_view_bottom";
      #       "ь" = "align_view_middle";
      #       "л" = "scroll_up";
      #       "о" = "scroll_down";
      #       "C-и" = "page_up";
      #       "C-а" = "page_down";
      #       "C-г" = "page_cursor_half_up";
      #       "C-в" = "page_cursor_half_down";
      #
      #       "т" = "search_next";
      #       "Т" = "search_prev";
      #     };
      #
      #     "Э" = "select_register";
      #     "C-я" = "suspend";
      #
      #     "C-ф" = "increment";
      #     "C-ч" = "decrement";
      #   };
      #
      #   select = {
      #     "р" = "extend_char_left";
      #     "о" = "extend_visual_line_down";
      #     "л" = "extend_visual_line_up";
      #     "д" = "extend_char_right";
      #
      #     "ц" = "extend_next_word_start";
      #     "и" = "extend_prev_word_start";
      #     "у" = "extend_next_word_end";
      #     "Ц" = "extend_next_long_word_start";
      #     "И" = "extend_prev_long_word_start";
      #     "У" = "extend_next_long_word_end";
      #
      #     "A-у" = "extend_parent_node_end";
      #     "A-и" = "extend_parent_node_start";
      #
      #     "т" = "extend_search_next";
      #     "Т" = "extend_search_prev";
      #
      #     "е" = "extend_till_char";
      #     "а" = "extend_next_char";
      #     "Е" = "extend_till_prev_char";
      #     "А" = "extend_prev_char";
      #
      #     "м" = "normal_mode";
      #     "п" = {
      #       "п" = "extend_to_file_start";
      #       "у" = "extend_to_last_line";
      #       "л" = "extend_line_up";
      #       "о" = "extend_line_down";
      #       "ц" = "extend_to_word";
      #     };
      #   };
      #
      #   insert = {
      #     "C-ы" = "commit_undo_checkpoint";
      #     "C-ч" = "completion";
      #     "C-к" = "insert_register";
      #
      #     "C-ц" = "delete_word_backward";
      #     "C-backspace" = "delete_word_backward";
      #     "A-в" = "delete_word_forward";
      #     "A-del" = "delete_word_forward";
      #     "C-г" = "kill_to_line_start";
      #     "C-л" = "kill_to_line_end";
      #     "C-р" = "delete_char_backward";
      #     "S-backspace" = "delete_char_backward";
      #     "C-в" = "delete_char_forward";
      #     "C-о" = "insert_newline";
      #     "S-tab" = "insert_tab";
      #   };
      # };

      theme = "catppuccin_mocha";
    };

    themes.catppuccin_mocha_transparent = {
      inherits = "catppuccin_mocha";
      "ui.background" = {};
    };

    languages.language = [
      {
        name = "typst";
        auto-pairs = {"$" = "$";};
      }
    ];
  };
}
