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

  local estado = {x = 0, y = 0}
  local posicaoMouse = {x = 0, y = 0}
  local objetoMouse = ""
  local nomesRegistrados = {}
  local numeroDeObjetos = 0
  local alternador = 0

  local function selection(event)

    local novoControle = self:findControlByName(sheet.laranja)
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
      showMessage("soltei")
      alternador = 0
    --  novoEdit.enabled = true
    end

    novoEdit.onMouseDown = function(event)
      alternador = 1
    --  novoEdit.enabled = false
      local centerMouse = {x = novoEdit.width / 2, y = novoEdit.height / 2 }
    end

    novoEdit.onMouseEnter = function(event)
      sheet.laranja = novoEdit.name
    end

    novoEdit.name = testeDeNome()

    showMessage(tableToStr(nomesRegistrados))

    return novoEdit.name

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
    obj.editfoda:setField("laranja");

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

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.barraDeFerramentas2);
    obj.label1:setText("Atributo ");
    obj.label1:setAlign("left");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.barraDeFerramentas2);
    obj.edit1:setText("");
    obj.edit1:setAlign("left");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setName("edit1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.barraDeFerramentas2);
    obj.label2:setText("Atributo ");
    obj.label2:setAlign("left");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.barraDeFerramentas2);
    obj.edit2:setText("");
    obj.edit2:setAlign("left");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setName("edit2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.barraDeFerramentas2);
    obj.label3:setText("Atributo ");
    obj.label3:setAlign("left");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.barraDeFerramentas2);
    obj.edit3:setText("");
    obj.edit3:setAlign("left");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setName("edit3");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            ferRectangle()
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            select()
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (_)
            ferRectangle()
        end, obj);

    obj._e_event3 = obj.imagem:addEventListener("onMouseMove",
        function (_, event)
            selection(event)
        end, obj);

    function obj:_releaseEvents()
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

        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.barraDeFerramentas ~= nil then self.barraDeFerramentas:destroy(); self.barraDeFerramentas = nil; end;
        if self.editfoda ~= nil then self.editfoda:destroy(); self.editfoda = nil; end;
        if self.editfoda2 ~= nil then self.editfoda2:destroy(); self.editfoda2 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.imagem ~= nil then self.imagem:destroy(); self.imagem = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.ficha ~= nil then self.ficha:destroy(); self.ficha = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.barraDeFerramentas2 ~= nil then self.barraDeFerramentas2:destroy(); self.barraDeFerramentas2 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
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
