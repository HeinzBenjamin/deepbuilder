
"use strict";

let se_adjust_field_offset_x = require('./se_adjust_field_offset_x.js')
let ro_gripper_setforce = require('./ro_gripper_setforce.js')
let se_adjust_field_offset_y = require('./se_adjust_field_offset_y.js')
let rt_is_ready = require('./rt_is_ready.js')
let ro_gripper_moveto = require('./ro_gripper_moveto.js')
let ro_gripper_open = require('./ro_gripper_open.js')
let se_adjust_fieldsize_y = require('./se_adjust_fieldsize_y.js')
let rt_set_action = require('./rt_set_action.js')
let ro_gripper_setspeed = require('./ro_gripper_setspeed.js')
let ro_get_block = require('./ro_get_block.js')
let se_get_values = require('./se_get_values.js')
let se_adjust_field_start_y = require('./se_adjust_field_start_y.js')
let rt_set_agent_presence = require('./rt_set_agent_presence.js')
let ro_move_point = require('./ro_move_point.js')
let ro_check_path = require('./ro_check_path.js')
let rt_wait_for_ready = require('./rt_wait_for_ready.js')
let rt_get_status = require('./rt_get_status.js')
let ro_gripper_close = require('./ro_gripper_close.js')
let ro_move_path = require('./ro_move_path.js')
let ro_get_state = require('./ro_get_state.js')
let rt_set_state = require('./rt_set_state.js')
let se_adjust_field_start_x = require('./se_adjust_field_start_x.js')
let ro_move_source = require('./ro_move_source.js')
let se_adjust_correction = require('./se_adjust_correction.js')
let se_adjust_resolution = require('./se_adjust_resolution.js')
let ro_move_cam = require('./ro_move_cam.js')
let ro_get_robot_state = require('./ro_get_robot_state.js')
let se_adjust_fieldsize_x = require('./se_adjust_fieldsize_x.js')
let ro_move_home = require('./ro_move_home.js')

module.exports = {
  se_adjust_field_offset_x: se_adjust_field_offset_x,
  ro_gripper_setforce: ro_gripper_setforce,
  se_adjust_field_offset_y: se_adjust_field_offset_y,
  rt_is_ready: rt_is_ready,
  ro_gripper_moveto: ro_gripper_moveto,
  ro_gripper_open: ro_gripper_open,
  se_adjust_fieldsize_y: se_adjust_fieldsize_y,
  rt_set_action: rt_set_action,
  ro_gripper_setspeed: ro_gripper_setspeed,
  ro_get_block: ro_get_block,
  se_get_values: se_get_values,
  se_adjust_field_start_y: se_adjust_field_start_y,
  rt_set_agent_presence: rt_set_agent_presence,
  ro_move_point: ro_move_point,
  ro_check_path: ro_check_path,
  rt_wait_for_ready: rt_wait_for_ready,
  rt_get_status: rt_get_status,
  ro_gripper_close: ro_gripper_close,
  ro_move_path: ro_move_path,
  ro_get_state: ro_get_state,
  rt_set_state: rt_set_state,
  se_adjust_field_start_x: se_adjust_field_start_x,
  ro_move_source: ro_move_source,
  se_adjust_correction: se_adjust_correction,
  se_adjust_resolution: se_adjust_resolution,
  ro_move_cam: ro_move_cam,
  ro_get_robot_state: ro_get_robot_state,
  se_adjust_fieldsize_x: se_adjust_fieldsize_x,
  ro_move_home: ro_move_home,
};
