reactors = {}
reactorPowerPerTick = {}
totalPower = 1


function defineReactors()
    print("Setting reactor connections up")

    --Map the reactors here
    reactors[1] = peripheral.wrap("BigReactors-Reactor_4")
    reactors[2] = peripheral.wrap("BigReactors-Reactor_6")
    reactors[3] = peripheral.wrap("BigReactors-Reactor_9")
    reactors[4] = peripheral.wrap("BigReactors-Reactor_5")
    reactors[5] = peripheral.wrap("BigReactors-Reactor_8")
    reactors[6] = peripheral.wrap("BigReactors-Reactor_7")
end


function initMonitor()
    monitor = peripheral.wrap("left")
    
    monitor.clear()
    monitor.setCursorPos(1,1)
    monitor.setTextColor(colors.white)
end


-- Monitoring Functions
function reactorStatus(state)
    

end


function totalPowerMonitor()

    monitor.setCursorPos(1,1)
    monitor.write("Current Power RF/t:")
    monitor.setTextColor(colors.white)
 
    for k, v in pairs(reactors) do 
        reactorPowerPerTick[k] = reactors[k].getEnergyProducedLastTick()     
    end
            
    totalPower = reactorPowerPerTick[1] + reactorPowerPerTick[2] + reactorPowerPerTick[3] + reactorPowerPerTick[4] + reactorPowerPerTick[5] + reactorPowerPerTick[6]
        
    totalPower = math.floor((totalPower) * 100)/100
     monitor.setCursorPos(20,1)
     if totalPower < 50000 then
         monitor.setTextColor(colors.red)
         monitor.write(totalPower)
     elseif totalPower > 50000 and totalPower < 100000 then
         monitor.setTextColor(colors.orange)
          monitor.write(totalPower)
     elseif totalPower > 100000 and totalPower < 300000 then
          monitor.setTextColor(colors.yellow)
          monitor.write(totalPower)
     elseif totalPower > 300000 then
          monitor.setTextColor(colors.green)
          monitor.write(totalPower)    
     end
end

function reactorStatus(k)
        --Reactor Status Active/Inactive
        state = reactors[k].getActive()
        
        if state == true then
            state = "Active"
            monitor.setTextColor(colors.green)
        else 
            state = "Inactive"
            monitor.setTextColor(colors.red)
        end
        monitor.setCursorPos(xPosition + 10,yPosition)
        monitor.write(state)
        monitor.setTextColor(colors.white)
end

function reactorRf(k)
        --Reactor RF/t
        yPosition = yPosition + 1
        monitor.setCursorPos(xPosition, yPosition)
        reactorPower = reactorPowerPerTick[k]
        if reactorPower == null then
            reactorPower = 0
        end 
        monitor.write("RF/t: ")
        monitor.setCursorPos(xPosition + 6, yPosition)
        reactorPower = math.floor((reactorPower) * 100)/100
        if reactorPower < 10000 then
            monitor.setTextColor(colors.red)
            monitor.write(reactorPower)
        elseif reactorPower > 10000 and reactorPower < 30000 then
             monitor.setTextColor(colors.yellow)
             monitor.write(reactorPower)
        elseif reactorPower > 30000 and reactorPower < 50000 then
            monitor.setTextColor(colors.orange)
            monitor.write(reactorPower)
        elseif reactorPower > 50000 then
            monitor.setTextColor(colors.green)
            monitor.write(reactorPower)    
        end
        monitor.setTextColor(colors.white)
        
end

function reactorTemp(k)
        --Reactor Core Temp
        yPosition = yPosition + 1
        monitor.setCursorPos(xPosition, yPosition)
        monitor.write("Core Temp: ")

        monitor.setCursorPos(xPosition + 10, yPosition)
        reactorCoreTemp = math.floor((reactors[k].getFuelTemperature()) * 100)/100
        if reactorCoreTemp < 100 then
            monitor.setTextColor(colors.green)
            monitor.write(reactorCoreTemp)
        elseif reactorCoreTemp > 100 and reactorCoreTemp < 500 then
             monitor.setTextColor(colors.yellow)
             monitor.write(reactorCoreTemp)
        elseif reactorCoreTemp > 500 and reactorCoreTemp < 1300 then
            monitor.setTextColor(colors.orange)
            monitor.write(reactorCoreTemp)
        elseif reactorCoreTemp > 1300 then
            monitor.setTextColor(colors.red)
            monitor.write(reactorCoreTemp)    
        end
        monitor.setTextColor(colors.white)
end

function reactorFuel(k)
        --Reactor Fuel Burn mB/t
        yPosition = yPosition + 1
        monitor.setCursorPos(xPosition, yPosition)
        monitor.write("Fuel Burn mB/t: ")

        monitor.setCursorPos(xPosition + 15, yPosition)
        reactorFuelBurn = math.floor((reactors[k].getFuelConsumedLastTick()) * 100)/100
        if reactorFuelBurn < 1 then
            monitor.setTextColor(colors.green)
            monitor.write(reactorFuelBurn)
        elseif reactorFuelBurn > 1 and reactorFuelBurn < 3 then
             monitor.setTextColor(colors.yellow)
             monitor.write(reactorFuelBurn)
        elseif reactorFuelBurn > 3 and reactorFuelBurn < 5 then
            monitor.setTextColor(colors.orange)
            monitor.write(reactorFuelBurn)
        elseif reactorFuelBurn > 5 then
            monitor.setTextColor(colors.red)
            monitor.write(reactorFuelBurn)    
        end
        monitor.setTextColor(colors.white)
end

function perReactorStats()
    xPosition = 1
    yPosition = 3
    count = 0
    newLine = false

    for k, v in pairs(reactors) do
        
        --If reactor number is even then it will be displayed on the right hand side of the screen
        if (k % 2 == 0) then 
            --even 
            xPosition = 21
            newLine = true
        else 
            --false
            xPosition = 1
            newLine = false
        end 

        --Reactor Identifers
        monitor.setCursorPos(xPosition,yPosition)
        ReactorRfLabel = "Reactor " .. k .. ":"
        monitor.write(ReactorRfLabel)

        reactorStatus(k)
        reactorRf(k)
        reactorTemp(k)
        reactorFuel(k)


        --Move to new line
        if newLine == true then
            yPosition = yPosition + 2
        else 
            yPosition = yPosition - 3
        end 

    end
end

--Update Monitor Loop
function updateMonitor()
    while (1 == 1)
    do
        monitor.clear()
        monitor.write("")
        monitor.setTextColor(colors.white)

        perReactorStats()
        totalPowerMonitor()
        
        sleep(1)
    end 

end

--Pre req functions
defineReactors()
initMonitor()

--Start update monitor loop, everything in here will loop indefinetely 
updateMonitor()
