#library(svgR)
svg_print_trial_image = function(dt_position, test, trialID){
  SIZE = c(400, 400)
  transform = list(translate = c(SIZE/2), scale = c(3, 3))
  svgR(wh = SIZE,
    svg_make_trial_image(dt_position, test, trialID, transform = transform)
  )
}

svg_make_trial_image %<c-% function (dt_position, test, trialID, ...){
  attrs = list(...)
  g(
    id = paste(get_trial_type(test, trialID), trialID, sep = "", collapse = ""),
    attrs,
    svg_add_arena(test),
    svg_add_goal(test, trialID),
    if(get_trial_type(test, trialID) == "Allo") svg_add_mark(test, trialID),
    svg_add_player_path(test, trialID, dt_position)
  )
}