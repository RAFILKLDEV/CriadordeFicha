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

  local modoSelecao = {'Select','Editar'}
  local estado = {x = 0, y = 0}
  local posicaoMouse = {x = 0, y = 0}
  local objetoMouse = ""
  local nomesRegistrados = {}
  local numeroDeObjetos = 0
  local modoAtual = ""
  local alternador = false

  local function kek(name)

    if alternador == true then



    end


  end

  local function menu(localX, localY)

    local menuzinho = GUI.newPopupForm("popup")

    menuzinho:setNodeObject(self.sheet)

    GUI.showPopup(menuzinho, {placement="mouse"})

  end

  local function selection(event,name)
  
    posicaoMouse.x = event.x
    posicaoMouse.y = event.y
    sheet.amarelo = "x = " .. posicaoMouse.x .. " y = " .. posicaoMouse.y

    


  end

  function mover(name)

    local novoControle = self:findControlByName(name)

    novoControle.top = 600

  end

  function selecionar(name, o1, o2, o3)

    local novoControle = self:findControlByName(name)

    local largura = 0
    local altura = 0
    

    if o3 == true then
      largura = novoControle.width - 8
      altura = novoControle.height - 8
    end

    local novoEdit = GUI.newImage()
        novoEdit.left = novoControle[o1] + (largura)
        novoEdit.top = novoControle[o2] + (altura)
        novoEdit.width = 8
        novoEdit.height = 8
        novoEdit:setParent(self.ficha)
        novoEdit.src = "/imagens/dot.png"
        novoEdit.hitTest = true
        novoEdit.onClick = function()
          
        novoEdit.left =  posicaoMouse.x
        novoEdit.top = posicaoMouse.y

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
    novoEdit.onClick = function()

      selecionar(novoEdit.name, "left", "top", false)
      selecionar(novoEdit.name, "left", "top", true)

    end

    novoEdit.onMouseMove = function()

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
            selection(event, sheet.laranja)
        end, obj);

    obj._e_event4 = obj.imagem:addEventListener("onMouseDown",
        function (_, event)
        end, obj);

    obj._e_event5 = obj.imagem:addEventListener("onMenu",
        function (_, x, y)
            menu(x,y)
        end, obj);

    obj._e_event6 = obj.imagem:addEventListener("onMouseUp",
        function (_, event)
        end, obj);

    obj._e_event7 = obj.imagem:addEventListener("onClick",
        function (_)
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event7);
        __o_rrpgObjs.removeEventListenerById(self._e_event6);
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

        if self.ficha ~= nil then self.ficha:destroy(); self.ficha = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.barraDeFerramentas ~= nil then self.barraDeFerramentas:destroy(); self.barraDeFerramentas = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.editfoda ~= nil then self.editfoda:destroy(); self.editfoda = nil; end;
        if self.editfoda2 ~= nil then self.editfoda2:destroy(); self.editfoda2 = nil; end;
        if self.imagem ~= nil then self.imagem:destroy(); self.imagem = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
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
