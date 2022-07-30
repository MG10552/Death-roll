--[[ WoW gambling on gold rolls
    one person rolls in X scope
    if result is not one other person rolls
    in the scope of previous result and again
    if result is not 1 then player one rolls again
    over and over until 1 is reached
    human factor is unnecesery just prints and players
]] 

function round(number, decimals)
    local power = 10^decimals
    return math.floor(number * power) / power
end

function display()
    math.randomseed(os.time())
    rollID = 1
    player = 0
    hRoll = 0
    lRoll = 0
    print("How much gold do you want to roll?")
    input = io.read()
    range = tonumber(input)
    if range == nil then
        --error custom - reteat until number is given.
        repeat
            io.write(input .. " is not valid number. Try again.\n")
            input2 = io.read()
        until tonumber(input2) ~= nil
        --error custom - transfer new good input as a range.
        range = input2
        print("\nFinally some good f#cking food and a number. Begin.")
      else
        print("OK. Begin.")
    end
    print("\n")
    io.write("1 to ", range, "-> rolling for gold.\n")
    print("\n")
    return range
end

function execRoll(scope)
    rangeUpdated = 0
    rangeUpdated = math.random(scope)
    proc = round(((rangeUpdated/scope)*100), 0)
    if (rangeUpdated > ((scope/2)-1)) then
        io.write("(", rangeUpdated, " out of ", scope, " [", proc, "%]) >>> High roll!")
        hRoll = hRoll + 1
    else 
        io.write("(", rangeUpdated, " out of ",scope, " [", proc, "%]) <<< Low roll! ")
        lRoll = lRoll + 1
    end
    range = rangeUpdated 
    return range
end

function compareScore()
    repeat
        whichPlayer = math.fmod(rollID,2)
        if whichPlayer == 0 then
            io.write("Player#2 roll: ")
            player = 1
        else
            io.write("Player#1 roll: ")
            player = 2
        end 
        rollID = rollID + 1
        io.write("\n\tRolled: ", execRoll(range), "\n")
    until range == 1
    print("\n\tVictory! Player#".. player .. " is a winner. You can collect your gold.")
    print("\tSome stats:")
    print("\tIt took " .. hRoll .. " high rolls and " .. lRoll .. " low rolls to conclude the game.")
    end

print("\n\tTLDR: You decide on amount of gold to gamble for.")
print("\tYou take that amount as a roll range.")
print("\tBoth players roll and first to roll 1 loses the bet.\n")
display()
compareScore()
