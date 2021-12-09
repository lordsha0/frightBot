require 'discordrb'

## Bot login setup
tokenFile = File.foreach("./settings.txt").map { |line| line.split(' ').join(' ') }
botToken = tokenFile[0].to_s
botClientId = tokenFile[1].to_s
botPrefix = tokenFile[2].to_s

bot = Discordrb::Commands::CommandBot.new token: "#{botToken}", client_id: "#{botClientId}", prefix: "#{botPrefix}"


## Commands block
# witch lofi music video command
bot.command :witch do |action|
    action.respond("here, you lofi witch: https://www.youtube.com/watch?v=4Hg1Kudd_x4")
end

#  command
bot.command :insertHere do |action|
    action.respond()
end

# basic help command
bot.command :help do |action|
    action.respond("""
        I can help you with all the commands I have:
        -help  : shows the list of commands
        -ping  : makes me respond 'hey'
        -witch : gives you a lofi music video for witches
    """)
end

# basic ping command
bot.command :ping do |action|
    action.respond("hey")
end


## Bot running instructions
at_exit { bot.stop }
bot.run
