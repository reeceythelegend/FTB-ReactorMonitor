reactors = {}

function defineReactors()
    print("Setting reactor connections up")

    reactors[1] = peripheral.wrap("BigReactors-Reactor_4")
    reactors[2] = peripheral.wrap("BigReactors-Reactor_6")
    reactors[3] = peripheral.wrap("BigReactors-Reactor_9")
    reactors[4] = peripheral.wrap("BigReactors-Reactor_5")
    reactors[5] = peripheral.wrap("BigReactors-Reactor_8")
    reactors[6] = peripheral.wrap("BigReactors-Reactor_7")
end

function status(reactorNum)
    status = reactors[reactorNum].getActive()
    print("Reactor ", reactorNum, " status is ", status)
end

function enable(reactorNum)
    reactors[reactorNum].setActive(true)
    print("Reactor ", reactorNum, " enabled")
end

function disable(reactorNum)
    reactors[reactorNum].setActive(false)
    print("Reactor ", reactorNum, " disabled")
end

function enableAll()
    for k, v in pairs(reactors)
        do 
            reactors[k].setActive(true)
    end 
print("All Reactors Enabled")
end

function disableAll()
    for k, v in pairs(reactors)
        do 
            reactors[k].setActive(false)
    end 
print("All Reactors Disabled")
end

defineReactors()