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

dxDrawText("Hejka!",0,0,w,h,white,2*(scl/2),"default-bold","center","center")


dxSetBlendMode("blend")
dxSetRenderTarget()
end
```
![alt text](https://cdn.discordapp.com/attachments/1122096051080401018/1220122193854464081/image-38.png?ex=660dca57&is=65fb5557&hm=db40859f257547ec779735d090d06fdb54f230c3cf7bb439ed41f3dd9a64cdf3&)
