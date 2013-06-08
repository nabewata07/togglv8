#! /usr/bin/env rvm ruby-1.9.3-head do ruby
# encoding: utf-8

require_relative 'togglV8'
require 'time'

tog = Toggl.new

# tog = Toggl.new(toggl_api_key)
# tog = Toggl.new(username, password)
# tog = Toggl.new('4p2hx5sfvb@snkmail.com') # ERROR

def print_projects(tog)
  ws = tog.workspaces
  ws.each do |w|
    wid = w['id']
    @wname=w['name']

    tp = Hash.new
    ts = tog.tasks(wid)
    ts.each do |t|
      tp[t['pid']] = t['name']  # TODO: handle collisions (>1 task / project)
    end

    ps = tog.projects(wid)
    ps.each do |p|
      @pname = p['name'] + " [" + p['id'].to_s + "] "
      @tname = tp[p['id']] ? ' (' + tp[p['id']] + ')' : ''
      puts "#@wname - #@pname#@tname"
    end

    us = tog.users(wid)
    us.each do |u|
      @uname = u['fullname'] + "/" + u['email']
      puts "#@wname : #@uname"
    end
  end
end

#---- Workspaces ----#
# tk       : 282224  #
# HomeAway : 344974  #
#------- User -------#
# uid      : 360643  #
#--------------------#

if __FILE__ == $0
  tog.debugOn

  # ap tog.me
  # ap tog.me(true)
  # ap tog.me('false')

  # print_projects(tog)

  # ap tog.get_project(2882160)

  # ap tog.clients
  # ap tog.clients(282224)
  # ap tog.clients(344974)
  # ap tog.create_client({name: "✈ Brazil", wid: 282224})
  # ap tog.update_client(1150763, {notes: "updated notes"})
  # ap tog.get_client(1150763)
  # ap tog.delete_client(1101640)

  # ap tog.get_client_projects(1101632, {active: 'bot'})
  # ap tog.get_client_projects(1101640, {active: 'true'})
  # ap tog.get_client_projects(1150638, {active: 'false'})
  # ap tog.get_client_projects(1150488)
  # ap tog.get_client_projects(1101650, {active: ''})

  # ap tog.create_project({:name => "HUGE project", :wid => "282224"})
  # ap tog.projects(282224, {active: true})
  # ap tog.projects(344974, {active: 'both'})
  # ap tog.get_project(2931253)
  # ap tog.update_project(2931253, {name: "Project %s" % Time.now.utc.iso8601 , active: false})
  # ap tog.get_project_users(2931296)

  # ap tog.create_project_user({pid: 2931296, uid: 509726})
  # ap tog.update_project_user(8310837, {manager: false, rate: 7})
  # ap tog.delete_project_user(8310837)

  # ap tog.create_time_entry({description: "Workspace time entry", duration:1200, start: "2013-03-05T07:55:55.000Z", wid:282224})
  # ap tog.create_time_entry({description: "Project time entry", duration:600, start: "2013-03-06T08:44:44.000Z", pid:2931296})
  # ap tog.create_time_entry({description: "Task time entry", duration:300, start: "2013-03-07T09:33:33.000Z", tid:1922686})
  # ap tog.get_time_entry(77633704)
  # ap tog.get_time_entry(77633705)
  # ap tog.get_time_entry(77633706)
  # ap tog.update_time_entry(77633704, {description: "Workspace time entry - updated", duration:1300})
  # ap tog.update_time_entry(77633705, {description: "Project time entry - updated", duration:700})
  # ap tog.update_time_entry(77633706, {description: "Task time entry - updated", duration:400})
  # ap tog.delete_time_entry(77633704)
  # ap tog.delete_time_entry(77633705)
  # ap tog.delete_time_entry(77633706)

  # ap tog.get_time_entries
  # ap tog.get_time_entries("2013-06-04T18:32:12+00:00")
  # ap tog.get_time_entries("2013-06-04T18:32:12+00:00", Time.new(2013, 6, 5, 2, 2, 2, "+02:00"))

  # tag = tog.create_tag({name: "tigger tag",wid: 282224})
  # ap tag
  # ap tog.update_tag(tag["id"], {name: tag["name"].upcase})
  # ap tog.delete_tag(tag["id"])

  # ap tog.create_task({}) # ERRORS
  # ap tog.create_task({name: "TASK 4", pid: 2883126})
  # ap tog.create_task({name: "TASK 2", pid: 2883126})
  # ap tog.create_task({name: "TASK 3", pid: 2883126})
  # ap tog.update_task(1894758, {active: true, estimated_seconds: 45000, fields: "done_seconds,uname"})
  # ap tog.update_task(1894758, 1894732, {active: false})
  # ap tog.tasks(282224)
  # ap tog.tasks(282224, {active: :true})
  # ap tog.tasks(282224, {active: false})
  # ap tog.tasks(282224, {active: 'both'})
  # ap tog.tasks(344974, {active: 'both'})
  # ap tog.get_task(1894738)
  # ap tog.delete_task(1894728)
  # ap tog.delete_task(1922691)
  # ap tog.delete_task(1922690, 1922688)

  # ap tog.users(282224)

end