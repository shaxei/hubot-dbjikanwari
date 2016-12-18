# Description
#   A hubot script that does the things
#
# Configuration:
#   LIST_OF_ENV_VARS_TO_SET
#
# Commands:
#   hubot hello - <what the respond trigger does>
#   orly - <what the hear trigger does>
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   aki

module.exports = (robot) ->
  robot.respond /次の時間は？/, (msg) ->
    
    #現在時刻取得
    now = new Date
    month = now.getMonth()
    date = now.getDate()
    hour = now.getHours()
    
    #月指定
    months = ["January","February","March","April","May","June","July","August","September","October","November","December"]
    dbmonth = "#{months[month]}"
    
    #日指定
    dbdate = "#{date}"
    
    #限指定
    if hour < 10
      dbgen = 1
    else if hour < 12
      dbgen = 2
    else if hour < 15
      dbgen = 3
    else if hour < 17
      dbgen = 4
    else
      dbgen = 5
      
    #SQL文組み立て
    sqlstr = "SELECT #{dbgen} FROM \'#{dbmonth}\' WHERE date = #{dbdate}"
    
    #出力
    msg.send "#{sqlstr}"
