require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaTeste()
    local obj = GUI.fromHandle(_obj_newObject("form"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", rawget(obj, "setNodeObject"));

    function obj:setNodeObject(nodeObject)
        sheet = nodeObject;
        self.sheet = nodeObject;
        self:_oldSetNodeObjectFunction(nodeObject);
    end;

    function obj:setNodeDatabase(nodeObject)
        self:setNodeObject(nodeObject);
    end;

    _gui_assignInitialParentForForm(obj.handle);
    obj:beginUpdate();
    obj:setFormType("sheetTemplate");
    obj:setDataType("br.com.meusite.MeuDataType");
    obj:setTitle("Ficha de Teste");
    obj:setName("frmFichaTeste");
    obj:setWidth(50);



  require("gui.lua");
  require("utils.lua");

  local estado = {x = 0, y = 0}
  local posicaoMouse = {x = 0, y = 0}
  local objetoMouse = ""
  local nomesRegistrados = {}
  local numeroDeObjetos = 0
  local alternador = 0

  local function destaque()

    

  end

  local function selection(event)

    local novoControle = self:findControlByName(self.field_name.text)
    posicaoMouse.x = event.x
    posicaoMouse.y = event.y
    sheet.amarelo = "x = " .. posicaoMouse.x .. " y = " .. posicaoMouse.y

    if alternador == 1 then
      novoControle.left = posicaoMouse.x
      novoControle.top = posicaoMouse.y
    end

  end

  local function testeDeNome()

    local nome = "rectangle" 
    local novoNome = nome .. (numeroDeObjetos)

      if numeroDeObjetos == 0 then
        -- Primeiro Objeto
        table.insert(nomesRegistrados, novoNome)
        numeroDeObjetos = numeroDeObjetos + 1
        nomeTemp = novoNome
        return novoNome    

      else numeroDeObjetos = numeroDeObjetos + 1  
        table.insert(nomesRegistrados, novoNome) 
        return novoNome
        
      end

  end

  local function ferRectangle()

    local novoEdit = GUI.newRectangle()
    novoEdit.left = 100
    novoEdit.top = 100
    novoEdit.color = "blue"
    novoEdit:setParent(self.ficha)
    novoEdit.enabled = true
    novoEdit.hitTest = true
    novoEdit.onMouseUp = function(event)
      alternador = 0
    --  novoEdit.enabled = true
    end

    novoEdit.onMouseDown = function(event)
      alternador = 1
      
    --  novoEdit.enabled = false
      local centerMouse = {x = novoEdit.width / 2, y = novoEdit.height / 2 }
    end

    novoEdit.onMouseEnter = function(event)
      self.field_name.text = novoEdit.name

    end

    novoEdit.name = testeDeNome()

    showMessage(tableToStr(nomesRegistrados))

    return novoEdit.name

  end 

  local function bob()
    
    self.field_name.items = nomesRegistrados

  end




    obj.barraDeFerramentas = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.barraDeFerramentas:setParent(obj);
    obj.barraDeFerramentas:setName("barraDeFerramentas");
    obj.barraDeFerramentas:setAlign("left");
    obj.barraDeFerramentas:setWidth(50);
    obj.barraDeFerramentas:setColor("yellow");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.barraDeFerramentas);
    obj.layout1:setAlign("left");
    obj.layout1:setHeight(25);
    obj.layout1:setName("layout1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setAlign("top");
    obj.button1:setWidth(50);
    obj.button1:setText("A");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout1);
    obj.button2:setAlign("top");
    obj.button2:setWidth(50);
    obj.button2:setText("Seleção");
    obj.button2:setName("button2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout1);
    obj.button3:setAlign("top");
    obj.button3:setWidth(50);
    obj.button3:setText("Editar");
    obj.button3:setName("button3");

    obj.ficha = GUI.fromHandle(_obj_newObject("layout"));
    obj.ficha:setParent(obj);
    obj.ficha:setName("ficha");
    obj.ficha:setAlign("left");
    obj.ficha:setWidth(1000);

    obj.imagem = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.imagem:setParent(obj.ficha);
    obj.imagem:setName("imagem");
    obj.imagem:setLeft(0);
    obj.imagem:setTop(0);
    obj.imagem:setAlign("left");
    obj.imagem:setWidth(500);
    obj.imagem:setHitTest(true);

    obj.editfoda = GUI.fromHandle(_obj_newObject("edit"));
    obj.editfoda:setParent(obj.ficha);
    obj.editfoda:setName("editfoda");
    obj.editfoda:setLeft(0);
    obj.editfoda:setTop(0);
    obj.editfoda:setField("kek");

    obj.editfoda2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.editfoda2:setParent(obj.ficha);
    obj.editfoda2:setName("editfoda2");
    obj.editfoda2:setLeft(100);
    obj.editfoda2:setWidth(250);
    obj.editfoda2:setTop(0);
    obj.editfoda2:setField("amarelo");

    obj.barraDeFerramentas2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.barraDeFerramentas2:setParent(obj);
    obj.barraDeFerramentas2:setName("barraDeFerramentas2");
    obj.barraDeFerramentas2:setAlign("right");
    obj.barraDeFerramentas2:setWidth(300);
    obj.barraDeFerramentas2:setColor("brown");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.barraDeFerramentas2);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(150);
    obj.layout2:setName("layout2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setText("name");
    obj.label1:setAlign("top");
    obj.label1:setHeight(35);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setText("left");
    obj.label2:setAlign("top");
    obj.label2:setHeight(35);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout2);
    obj.label3:setText("top");
    obj.label3:setAlign("top");
    obj.label3:setHeight(35);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout2);
    obj.label4:setText("width");
    obj.label4:setAlign("top");
    obj.label4:setHeight(35);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout2);
    obj.label5:setText("height");
    obj.label5:setAlign("top");
    obj.label5:setHeight(35);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout2);
    obj.label6:setText("opacity");
    obj.label6:setAlign("top");
    obj.label6:setHeight(35);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout2);
    obj.label7:setText("rotationAngle");
    obj.label7:setAlign("top");
    obj.label7:setHeight(35);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.barraDeFerramentas2);
    obj.layout3:setAlign("left");
    obj.layout3:setWidth(150);
    obj.layout3:setName("layout3");

    obj.field_name = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.field_name:setParent(obj.layout3);
    obj.field_name:setName("field_name");
    obj.field_name:setAlign("top");
    obj.field_name:setHeight(35);
    obj.field_name:setTransparent(true);
    obj.field_name:setHorzTextAlign("center");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout3);
    obj.edit1:setField("field_left");
    obj.edit1:setAlign("top");
    obj.edit1:setHeight(35);
    obj.edit1:setTransparent(true);
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setField("field_top");
    obj.edit2:setAlign("top");
    obj.edit2:setHeight(35);
    obj.edit2:setTransparent(true);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setName("edit2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout3);
    obj.edit3:setField("field_width");
    obj.edit3:setAlign("top");
    obj.edit3:setHeight(35);
    obj.edit3:setTransparent(true);
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setName("edit3");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout3);
    obj.edit4:setField("field_height");
    obj.edit4:setAlign("top");
    obj.edit4:setHeight(35);
    obj.edit4:setTransparent(true);
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setName("edit4");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout3);
    obj.edit5:setField("field_opacity");
    obj.edit5:setAlign("top");
    obj.edit5:setHeight(35);
    obj.edit5:setTransparent(true);
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setName("edit5");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout3);
    obj.edit6:setField("field_rotationAngle");
    obj.edit6:setAlign("top");
    obj.edit6:setHeight(35);
    obj.edit6:setTransparent(true);
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setName("edit6");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.barraDeFerramentas2);
    obj.dataLink1:setFields({'field_left', 'field_top','field_width','field_height','field_opacity','field_rotationAngle'});
    obj.dataLink1:setName("dataLink1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            ferRectangle()
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            destaque()
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (_)
            bob()
        end, obj);

    obj._e_event3 = obj.imagem:addEventListener("onMouseMove",
        function (_, event)
            selection(event)
        end, obj);

    obj._e_event4 = obj.field_name:addEventListener("onChange",
        function (_)
            local novoControle = self:findControlByName(self.field_name.text)
            
                  sheet.field_left = novoControle.left
                  sheet.field_top = novoControle.top
                  sheet.field_width = novoControle.width
                  sheet.field_height = novoControle.height
                  sheet.field_opacity = novoControle.opacity
                  sheet.field_rotationAngle = novoControle.rotationAngle
            
            
                for i = 1, #nomesRegistrados, 1 do
            
                  local novoControle2 = self:findControlByName(nomesRegistrados[i])
            
                  if self.field_name.text == nomesRegistrados[i]  then
                    novoControle2.strokeColor = "yellow"
                    novoControle2.strokeSize = 3.0
                  elseif self.field_name.text ~= nomesRegistrados[i] then
                    novoControle2.strokeColor = "black"
                    novoControle2.strokeSize = 0
                  end
            
                end
        end, obj);

    obj._e_event5 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local novoControle = self:findControlByName(self.field_name.text)
            
                novoControle.left = sheet.field_left
                novoControle.top = sheet.field_top
                novoControle.width = sheet.field_width
                novoControle.height = sheet.field_height
                novoControle.opacity = sheet.field_opacity
                novoControle.rotationAngle = sheet.field_rotationAngle
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event5);
        __o_rrpgObjs.removeEventListenerById(self._e_event4);
        __o_rrpgObjs.removeEventListenerById(self._e_event3);
        __o_rrpgObjs.removeEventListenerById(self._e_event2);
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.barraDeFerramentas ~= nil then self.barraDeFerramentas:destroy(); self.barraDeFerramentas = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.ficha ~= nil then self.ficha:destroy(); self.ficha = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.editfoda ~= nil then self.editfoda:destroy(); self.editfoda = nil; end;
        if self.editfoda2 ~= nil then self.editfoda2:destroy(); self.editfoda2 = nil; end;
        if self.imagem ~= nil then self.imagem:destroy(); self.imagem = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.field_name ~= nil then self.field_name:destroy(); self.field_name = nil; end;
        if self.barraDeFerramentas2 ~= nil then self.barraDeFerramentas2:destroy(); self.barraDeFerramentas2 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaTeste()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaTeste();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaTeste = {
    newEditor = newfrmFichaTeste, 
    new = newfrmFichaTeste, 
    name = "frmFichaTeste", 
    dataType = "br.com.meusite.MeuDataType", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha de Teste", 
    description=""};

frmFichaTeste = _frmFichaTeste;
Firecast.registrarForm(_frmFichaTeste);
Firecast.registrarDataType(_frmFichaTeste);

return _frmFichaTeste;
