local status_ok, lightspeed = pcall(require, "lightspeed")
if not status_ok then
	return
end

lightspeed.setup({
	ignore_case = false,
	exit_after_idle_msecs = { unlabeled = 1000, labeled = nil },
	--- s/x ---
	jump_to_unique_chars = { safety_timeout = 400 },
	match_only_the_start_of_same_char_seqs = true,
	force_beacons_into_match_width = true,
	-- Display characters in a custom way in the highlighted matches.
	substitute_chars = { ["\r"] = "¬" },
	-- These keys are captured directly by the plugin at runtime.
	special_keys = {
		next_match_group = "<space>",
		prev_match_group = "<tab>",
	},
	--- f/t ---
	limit_ft_matches = 4,
	repeat_ft_with_target_char = false,
})

vim.cmd([[
    " trigger keys
    augroup lightspeed_active
      autocmd!
      autocmd User LightspeedFtEnter let g:lightspeed_active = 1
      autocmd User LightspeedFtLeave unlet g:lightspeed_active
    augroup end

    " repeat last
    let g:lightspeed_last_motion = ''
    augroup lightspeed_last_motion
      autocmd!
      autocmd User LightspeedSxEnter let g:lightspeed_last_motion = 'sx'
      autocmd User LightspeedFtEnter let g:lightspeed_last_motion = 'ft'
    augroup end
    " normal mode
    nmap <expr> ; g:lightspeed_last_motion == 'sx' ? "<Plug>Lightspeed_;_sx" : "<Plug>Lightspeed_;_ft"
    nmap <expr> , g:lightspeed_last_motion == 'sx' ? "<Plug>Lightspeed_,_sx" : "<Plug>Lightspeed_,_ft"
    " visual mode
    vmap <expr> ; g:lightspeed_last_motion == 'sx' ? "<Plug>Lightspeed_;_sx" : "<Plug>Lightspeed_;_ft"
    vmap <expr> , g:lightspeed_last_motion == 'sx' ? "<Plug>Lightspeed_,_sx" : "<Plug>Lightspeed_,_ft"
  ]])
