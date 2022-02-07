# FTB-ReactorMonitor
 Monitor and control BigReactors using ComputerCraft mod for FTB Direwolf20 1.7.10

There are 3 parts to this:
- startup script - runs reactorapi.lua and monitorreactors.lua on when the computer boots
- reactorapi - allows control of the reactor via lua cmdline on the computer
- monitorreactors.lua - displays stats about the reactors to a display (4x3)

## Reactor API
Commands: 
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
Enables all reactors

### Disable All Reactors 

```
reactorApi.disableAll()
```
Disables all reactors