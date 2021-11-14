require'lightspeed'.setup {
    jump_to_first_match = true,
    jump_on_partial_input_safety_timeout = 400,
    highlight_unique_chars = false,
    grey_out_search_area = true,
    match_only_the_start_of_same_char_seqs = true,
    full_inclusive_prefix_key = '<c-x>',
    exit_after_idle_msecs = { labeled = 1000, unlabeled = 1000 },
}
