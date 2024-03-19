# Easy 3D interface in MTA!

Simple resource for creating 3D interfaces.

# Client

Create 3D interface

```lua
number scaler, number w, number h, number id, element rendertarget create3DInterface(number x, number y, number z, number w, number h, [number scaler, number distance, number lookx, number looky, number lookz])
```

Change 3D interface position

```lua
bool change3DInterfacePosition(number id, number x, number y, number z)
```

Attach 3D interface to element

```lua
bool attach3DInterfaceToElement(number id, element element, [number offX, number offY, number offZ])
```

Detach 3D interface

```lua
bool detach3DInterface(number id)
```

Destroy 3D interface

```lua
bool destroy3DInterface(number id)
```
