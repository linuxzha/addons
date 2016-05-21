local listIdSelectedComponant;
local ColumsSort ={Colums = 1, SortUp = true};
local TableTempListCountByPlayer = {};

SELLENCHANT_NUM_LINE_COMPONANTS = 11;
SELLENCHANT_NUM_LINE_DETAIL_BYPLAYER_COMPONANTS = 4;

function SellEnchant_Componant_Frame_OnShow()
		SellEnchant_Flow_DebugMessage("SellEnchant_Componant_Frame_OnShow - ENTER");
	SellEnchant_DebugMessage("Entered Function SellEnchant_Componant_Frame_OnShow");
	SortComponant();
end

function SellEnchant_Componant_Frame_OnUpdate()
	SellEnchant_DebugMessage("Entered Function SellEnchant_Componant_Frame_OnUpdate");
	UpDateListeComponant();
	UpDate_Componant_ListeDetail();
end

function SelectIdComponant(id)
	SellEnchant_DebugMessage("Entered Function SelectIdComponant");
	listIdSelectedComponant = id;
	if id then SellEnchant_Componant_ScrollFrameScrollBar:SetValue((id-1)*SELLENCHANT_NUM_LINE_COMPONANTS); end
	SellEnchant_Componant_Frame_OnUpdate();
end

function UpDateListeComponant()
	SellEnchant_DebugMessage("Entered Function UpdateListeComponant");
	if (not SellEnchant_ListComponent) then
		SellEnchant_Componant_ScrollFrame_Children:Hide();
		return; 
	end
	SellEnchant_Componant_ScrollFrame_Children:Show();
	
	FauxScrollFrame_Update(SellEnchant_Componant_ScrollFrame, ESell_Reagent_getNb(), SELLENCHANT_NUM_LINE_COMPONANTS, SELLENCHANT_NUM_LINE_COMPONANTS);
	for i=1, SELLENCHANT_NUM_LINE_COMPONANTS, 1 do
		local index;
		if (not FauxScrollFrame_GetOffset(SellEnchant_Componant_ScrollFrame)) then
			index = i;
		else
			index = i + FauxScrollFrame_GetOffset(SellEnchant_Componant_ScrollFrame);
		end

		if index == listIdSelectedComponant then
			getglobal("SellEnchant_Componant_List"..i):LockHighlight();
		else
			getglobal("SellEnchant_Componant_List"..i):UnlockHighlight();
		end

		if (SellEnchant_ListComponent[index]) then
			local reagentCountBag, reagentCountBank, reagentCountReroll = ESell_Reagent_getCount(index, SellEnchant_CourantPlayerName);
			local reagentName, reagentIcone = ESell_Reagent_getInfo(index);
			local reagentPriceUnite = ESell_Reagent_getPrice(index);

			getglobal("SellEnchant_Componant_List"..i.."_Icone"):SetTexture(reagentIcone);
			getglobal("SellEnchant_Componant_List"..i.."_Name"):SetText(reagentName);
			getglobal("SellEnchant_Componant_List"..i.."_Nb"):SetText(reagentCountBag);
			getglobal("SellEnchant_Componant_List"..i.."_NbBank"):SetText(reagentCountBank);
			getglobal("SellEnchant_Componant_List"..i.."_NbReroll"):SetText(reagentCountReroll);

			ESell_Money_SetPrice(reagentPriceUnite, "SellEnchant_Componant_List"..i.."_PriceUnite");

			local color;
			if ESell_Reagent_getUsed(index) then
				color = {0.90, 0.90, 0.90};
			else
				color = TEXTECOLOR[-2];				
			end
			getglobal("SellEnchant_Componant_List"..i.."_Name"):SetTextColor(color[1], color[2], color[3]);
			getglobal("SellEnchant_Componant_List"..i.."_Nb"):SetTextColor(color[1], color[2], color[3]);
			getglobal("SellEnchant_Componant_List"..i.."_NbBank"):SetTextColor(color[1], color[2], color[3]);
			getglobal("SellEnchant_Componant_List"..i.."_NbReroll"):SetTextColor(color[1], color[2], color[3]);

			getglobal("SellEnchant_Componant_List"..i):Show();
		else
			getglobal("SellEnchant_Componant_List"..i):Hide();			
		end
	end
end

function SortComponant(Colums)
	SellEnchant_DebugMessage("Entered Function SortComponant");
	local nameComponantSelected;

	if (not ESell_Reagent_getNb()) or not SellEnchant_ListComponent then
		return;
	end

	if listIdSelectedComponant then	nameComponantSelected = ESell_Reagent_getInfo(listIdSelectedComponant) end
	if (Colums) then
		if (ColumsSort.Colums == Colums) then
			ColumsSort.SortUp = not ColumsSort.SortUp;
		else
			ColumsSort.Colums = Colums;
		end
	end
	
	table.sort(SellEnchant_ListComponent, SortComponant_Sort);
	
	if nameComponantSelected then listIdSelectedComponant = ESell_Reagent_getId(nameComponantSelected) end
	SellEnchant_Componant_Frame_OnUpdate();
end

function SortComponant_Sort(e1,e2)
	SellEnchant_DebugMessage("Entered Function SortComponant_Sort");
	local value1, value2;
	local nbInBag1, nbInBank1, nbInReroll1  = ESell_Reagent_getCountWhithTable(e1["ByPlayer"], SellEnchant_CourantPlayerName);
	local nbInBag2, nbInBank2, nbInReroll2  = ESell_Reagent_getCountWhithTable(e2["ByPlayer"], SellEnchant_CourantPlayerName);

	if ColumsSort.Colums == 1 then
		value1 = e1.Name;
		value2 = e2.Name;
	end if ColumsSort.Colums == 2 then
		value1 = nbInBag1;
		value2 = nbInBag2;
	end if ColumsSort.Colums == 3 then
		value1 = nbInBank1;
		value2 = nbInBank2;
	end if ColumsSort.Colums == 4 then
		value1 = nbInReroll1;
		value2 = nbInReroll2;
	end if ColumsSort.Colums == 5 then
		value1 = e1.PriceUnite;
		value2 = e2.PriceUnite;
	end 

	if e1["IsUse"] ~= e2["IsUse"] then
		if not e1["IsUse"] then return false end
		if not e2["IsUse"] then return true end
	end
	if (value1 == nil) or (value1=="") or (value1==0) then
		return false;		
	end if (value2 == nil) or (value2=="") or (value2==0) then
		return true;		
	end 
	if ColumsSort.SortUp then
		if (value1 < value2 )then
			return true;		
		else
			return false;
		end
	else
		if (value1 > value2 )then
			return true;		
		else
			return false;
		end	
	end
end

function SellEnchant_Componant_List_OnClick()
	SellEnchant_DebugMessage("Entered Function SellEnchant_Componant_List_OnClick");
	if FauxScrollFrame_GetOffset(SellEnchant_Componant_ScrollFrame) then
		listIdSelectedComponant = this:GetID() + FauxScrollFrame_GetOffset(SellEnchant_Componant_ScrollFrame);
	else
		listIdSelectedComponant = this:GetID();
	end
	SellEnchant_Componant_Frame_OnUpdate();
end


function UpDate_Componant_ListeDetail()
	SellEnchant_DebugMessage("Update_Componant_ListeDetail - ENTER");
	if not listIdSelectedComponant then 
		SellEnchant_Componant_DetailFrame:Hide();
		return; 
	end
	SellEnchant_Componant_DetailFrame:Show();
	
	local player = ESell_Reagent_getPlayerListSave(listIdSelectedComponant);
	FauxScrollFrame_Update(SellEnchant_Componant_DetailFrame_ScrollFrame,table.getn(player),SELLENCHANT_NUM_LINE_DETAIL_BYPLAYER_COMPONANTS, SELLENCHANT_NUM_LINE_DETAIL_BYPLAYER_COMPONANTS);
	SellEnchant_Componant_DetailFrame_ScrollFrame:Show();
	local TableTempListCountByPlayer = {};
	table.foreachi(player,
		function (i, namePlayer)
			local nbInBag, nbInBank, nbInReroll  = ESell_Reagent_getCountWhithTable(SellEnchant_ListComponent[listIdSelectedComponant]["ByPlayer"], namePlayer);
			if namePlayer == SellEnchant_CourantPlayer[1] then
				tinsert(TableTempListCountByPlayer, 1 ,{namePlayer, nbInBag, nbInBank, nbInReroll})
			else
				tinsert(TableTempListCountByPlayer, {namePlayer, nbInBag, nbInBank, nbInReroll})				
			end
		end
	);
	for i=1, SELLENCHANT_NUM_LINE_DETAIL_BYPLAYER_COMPONANTS, 1 do
		local index = 0;
		if (not FauxScrollFrame_GetOffset(SellEnchant_Componant_ScrollFrame)) then
			index = i;
		else
			index = i + FauxScrollFrame_GetOffset(SellEnchant_Componant_ScrollFrame);
		end
		if (TableTempListCountByPlayer[i]) then
			
			getglobal("SellEnchant_Componant_Detail_ByPlayer_List"..i.."_Name"):SetText(TableTempListCountByPlayer[i][1]);
			getglobal("SellEnchant_Componant_Detail_ByPlayer_List"..i.."_NbBag"):SetText(TableTempListCountByPlayer[i][2]);
			getglobal("SellEnchant_Componant_Detail_ByPlayer_List"..i.."_NbBank"):SetText(TableTempListCountByPlayer[i][3]);
			getglobal("SellEnchant_Componant_Detail_ByPlayer_List"..i):Show();
		else
			getglobal("SellEnchant_Componant_Detail_ByPlayer_List"..i):Hide();
		end
	end
	if ((listIdSelectedComponant) and (listIdSelectedComponant ~= 0)) then
		local reagentName, reagentIcone, reagentDescription = ESell_Reagent_getInfo(listIdSelectedComponant);
		SellEnchant_Componant_DetailFrame_Info_Name:SetText(reagentName);
		SellEnchant_Componant_DetailFrame_Info_Icone:SetTexture(reagentIcone);
		SellEnchant_Componant_DetailFrame_Info_Description:SetText(reagentDescription);
		local reagentPrice = ESell_Reagent_getPrice(listIdSelectedComponant);
		SellEnchant_Componant_Detail_PriceUnite_EditBoxGold:SetNumber(ESell_Money_getMoney("Gold", reagentPrice));
		SellEnchant_Componant_Detail_PriceUnite_EditBoxSilver:SetNumber(ESell_Money_getMoney("Silver", reagentPrice));
		SellEnchant_Componant_Detail_PriceUnite_EditBoxCopper:SetNumber(ESell_Money_getMoney("Copper", reagentPrice));
		SellEnchant_Componant_DetailFrame:Show();
	end
	SellEnchant_DebugMessage("Update_Componant_ListeDetail - EXIT");
end

--------------------------------------------------------------------------------
-- Update reagent prices in database without losing focus of current edit box --
--------------------------------------------------------------------------------
function SellEnchant_OnTextChanged_EditBox(typeMoney)
	SellEnchant_DebugMessage("Entered Function SellEnchant_OnTextChanged_EditBox");
	if typeMoney ~= "Gold" then
		if ( getglobal("SellEnchant_Componant_Detail_PriceUnite_EditBox"..typeMoney):GetNumber() > 99 ) then
			getglobal("SellEnchant_Componant_Detail_PriceUnite_EditBox"..typeMoney):SetNumber(99);
		end
	end
	if ( getglobal("SellEnchant_Componant_Detail_PriceUnite_EditBox"..typeMoney):GetNumber() < 0 ) then
		getglobal("SellEnchant_Componant_Detail_PriceUnite_EditBox"..typeMoney):SetNumber(0);
	end

	ESell_Reagent_setPrice(typeMoney, getglobal("SellEnchant_Componant_Detail_PriceUnite_EditBox"..typeMoney):GetNumber(), listIdSelectedComponant);
	UpDateListeComponant();
end


-------------------------------------------------------
-- Update reagent price after Enter has been pressed --
-------------------------------------------------------
function SellEnchant_OnEnterPressed_EditBox(typeMoney)
	SellEnchant_DebugMessage("Entered Function SellEnchant_OnEnterPressed_editBox");
	if typeMoney ~= "Gold" then
		if ( getglobal("SellEnchant_Componant_Detail_PriceUnite_EditBox"..typeMoney):GetNumber() > 99 ) then
			getglobal("SellEnchant_Componant_Detail_PriceUnite_EditBox"..typeMoney):SetNumber(99);
		end
	end
	if ( getglobal("SellEnchant_Componant_Detail_PriceUnite_EditBox"..typeMoney):GetNumber() < 0 ) then
		getglobal("SellEnchant_Componant_Detail_PriceUnite_EditBox"..typeMoney):SetNumber(0);
	end
	ESell_Reagent_setPrice(typeMoney, getglobal("SellEnchant_Componant_Detail_PriceUnite_EditBox"..typeMoney):GetNumber(), listIdSelectedComponant);
	UpDateListeComponant();

	local nextTypeMoney;
	if typeMoney == "Gold" then
		nextTypeMoney = "Silver";
	end if typeMoney == "Silver" then
		nextTypeMoney = "Copper";
	end
	if nextTypeMoney then
		getglobal("SellEnchant_Componant_Detail_PriceUnite_EditBox"..nextTypeMoney):SetFocus();
	else
		this:ClearFocus();
	end
end


function SellEnchant_OnTabPressed_EditBox(typeMoney)
	SellEnchant_DebugMessage("Entered Function SellEnchant_OnEnterTabPresssed_editBox");
	if typeMoney ~= "Gold" then
		if ( getglobal("SellEnchant_Componant_Detail_PriceUnite_EditBox"..typeMoney):GetNumber() > 99 ) then
			getglobal("SellEnchant_Componant_Detail_PriceUnite_EditBox"..typeMoney):SetNumber(99);
		end
	end
	if ( getglobal("SellEnchant_Componant_Detail_PriceUnite_EditBox"..typeMoney):GetNumber() < 0 ) then
		getglobal("SellEnchant_Componant_Detail_PriceUnite_EditBox"..typeMoney):SetNumber(0);
	end
	ESell_Reagent_setPrice(typeMoney, getglobal("SellEnchant_Componant_Detail_PriceUnite_EditBox"..typeMoney):GetNumber(), listIdSelectedComponant);
	UpDateListeComponant();
	local nextTypeMoney;
	if ( IsShiftKeyDown() ) then
		if typeMoney == "Copper" then
			nextTypeMoney = "Silver";
		end if typeMoney == "Silver" then
			nextTypeMoney = "Gold";
		end	
	else
		if typeMoney == "Gold" then
			nextTypeMoney = "Silver";
		end if typeMoney == "Silver" then
			nextTypeMoney = "Copper";
		end
	end
	if nextTypeMoney then
		getglobal("SellEnchant_Componant_Detail_PriceUnite_EditBox"..nextTypeMoney):SetFocus();
	else
		this:ClearFocus();
	end
end


function SellEnchant_Tooltip(TableTexte)
	SellEnchant_DebugMessage("Entered Function SellEnchant_ToolTipyea");
	GameTooltip_SetDefaultAnchor(GameTooltip,this);
	GameTooltip:SetText(arg1);
	GameTooltip:AddLine(arg2, .75, .75, .75, 1);
	GameTooltip:Show();
end
