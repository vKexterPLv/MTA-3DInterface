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

# Example usage

```lua
local tdx = exports["dx3D"] -- dx3D or whatever you named the resource
local x,y,z = 0,0,3
local w,h = 300,100

scl,w,h,id,rt = tdx:create3DInterface(x,y,z,w,h)

if rt then
dxSetRenderTarget(rt,true)
dxSetBlendMode("modulate_add")

dxDrawRectangle(0,0,w,h,tocolor(36,36,36,255)

dxDrawText("Hello World!",0,0,w,h,white,2*(scl/2),"default-bold","center","center")


dxSetBlendMode("blend")
dxSetRenderTarget()
end
```
