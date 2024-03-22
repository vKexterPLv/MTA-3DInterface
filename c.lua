local id = 1
local tds = {}
local tmp = {}

function dxDraw3DInterface(id)
	assert(tds[id],"[dxDraw3DInterface] Can't render non existing 3D Interface!")
	d = tds[id]
	dxDrawMaterialLine3D(d.x,	d.y,	d.z,	d.x1,	d.y1,	d.z1,d.rt,d.wfordraw,tocolor(255,255,255,255),false,(d.lx or _),(d.ly or _),(d.lz or _))
end

addEventHandler("onClientRender",root,function()
	for k,v in pairs(tds) do
		x,y,z = getElementPosition(localPlayer)
		x1,y1,z1 = v.x,v.y,v.z
		
		dist = getDistanceBetweenPoints3D(x,y,z,x1,y1,z1)
		if dist < (v.dist or 50) then
			dxDraw3DInterface(v.id)
		end
	end
end)

function create3DInterface(x,y,z,w,h,scaler,dist,lx,ly,lz)
	assert(type(x) == "number", "[dxCreate3DInterface] X is not a number!")
	assert(type(y) == "number", "[dxCreate3DInterface] Y is not a number!")
	assert(type(z) == "number", "[dxCreate3DInterface] Z is not a number!")
	assert(type(w) == "number", "[dxCreate3DInterface] Width is not a number!")
	assert(type(h) == "number", "[dxCreate3DInterface] Height is not a number!")
	scaler = scaler or 20
	dist = dist or 50
	tmprt = dxCreateRenderTarget(w*scaler,h*scaler,true)
	assert(tmprt,"[dxCreate3DInterface] Can't create a render target!")
	tds[id] = {x=x,y=y,z=z+(h/200),x1=x,y1=y,z1=z-(h/200),rt=tmprt,wfordraw=w/100,w=w,h=h,id=id,dist=dist,lx=(lx or _),ly=(ly or _),lz=(lz or _)}
	tmprt = false
	id = id + 1
	
	-- iprint(id)
	return scaler,w*scaler,h*scaler,id-1,tds[id-1].rt
end


function change3DInterfacePosition(id,x,y,z)
	assert(tds[id],"[dxChange3DInterfacePosition] Can't change position of non existing 3D Interface!")
	assert(type(x) == "number", "[dxChange3DInterfacePosition] X is not a number!")
	assert(type(y) == "number", "[dxChange3DInterfacePosition] Y is not a number!")
	assert(type(z) == "number", "[dxChange3DInterfacePosition] Z is not a number!")
	
	h = tds[id].h
	
	tds[id].x,tds[id].y,tds[id].z = x,y,z+(h/100)
	tds[id].x1,tds[id].y1,tds[id].z1 = x,y,z-(h/100)
	return true
end

function attach3DInterfaceToElement(id,elem,ofX,ofY,ofZ)
	assert(tds[id],"[attach3DInterfaceToElement] Can't attach element to non existing 3D Interface!")
	assert(isElement(elem),"[attach3DInterfaceToElement] Element is not a element!")
	
	ofX,ofY,ofZ = ofX,ofY,ofZ or 0,0,0
	
	tds[id].attach = {}
	tds[id].attach.elem = elem
	tds[id].attach.x,tds[id].attach.y,tds[id].attach.z = ofX,ofY,ofZ
	
	tds[id].attach.preRender = function()
		x,y,z = getPositionFromElementOffset(tds[id].attach.elem,tds[id].attach.x,tds[id].attach.y,tds[id].attach.z)
		r = change3DInterfacePosition(id,x,y,z)
	end

	addEventHandler("onClientPreRender",root,tds[id].attach.preRender)
	
	return true
end

function detach3DInterface(id)
	assert(tds[id],"[detach3DInterface] Can't detach element from non existing 3D Interface!")
	assert(tds[id].attach,"[detach3DInterface] Can't detach non attached 3D Interface!")
	
	removeEventHandler("onClientPreRender",root,tds[id].attach.preRender)
	return true
end

function destroy3DInterface(id)
	assert(tds[id],"[destroy3DInterface] Can't destroy non existing 3D Interface!")

	destroyElement(tds[id].rt)

	if tds[id].attach then
		detach3DInterface(id)
	end

	tds[id] =  nil	
	
	return true
end
