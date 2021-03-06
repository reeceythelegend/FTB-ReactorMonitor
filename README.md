# FTB-ReactorMonitor
 Monitor and control BigReactors using the [BigReactors API & Computer Port](https://ftbwiki.org/Reactor_Computer_Port) and the [ComputerCraft](http://www.computercraft.info/wiki/Main_Page) mod for [FTB Direwolf20 1.7.10](https://www.curseforge.com/minecraft/modpacks/ftb-presents-direwolf20)

There are 3 parts to this:
- startup script - runs reactorapi and monitorreactors on when the computer boots
- reactorapi - allows control of the reactor via lua cmdline on the computer
- monitorreactors - displays stats about the reactors to a display (4x3)

## Reactor Monitor Preview
![4x3 Reactor Monitoring Display](/reactorMonitorDisplay.png)

## Reactor API

Example:
![Enable reactor command example](/reactorApiCommandExample.png)

### Enable Reactor
```
reactorApi.enable(1)
```
Enables Reactor 1

### Disable Reactor 

```
reactorApi.disable(1)
```
Disables Reactor 1

### Reactor Status

```
reactorApi.status(1)
```
Get status of reactor 1

### Enable All Reactors 

```
reactorApi.enableAll()
```

### Disable All Reactors 

```
reactorApi.disableAll()
```

