pageextension 50001 "ADM Page Ext50001" extends "Item List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {

        addlast(processing)
        {
            action("Total calories")
            {
                ApplicationArea = All;
                Caption = 'Total Calories';
                Image = NewSum;
                ToolTip = 'Show sum of the calories for every item';

                trigger OnAction()

                var
                    tot: Decimal;
                    item: Record Item;

                begin
                    Item.CalcSums("total calories");
                    tot := Item."total calories";
                    Message('La somma è %1', tot);
                end;
            }
            action("Total nutritional infos")
            {
                ApplicationArea = All;
                Caption = 'Total values';
                Image = NewSum;
                ToolTip = 'Show the sum';


                trigger OnAction()


                var
                    totalSum: Decimal;
                    ADMTemp: Record "ADM Nutritional Information" temporary;
                    ADM: Record "ADM Nutritional Information";
                    NutType: Enum "ADM Nutritional Info Type";

                begin
                    ADM.SetRange("Nutritional Type", NutType::Proteins);
                    totalSum := 0;
                    if ADM.CalcSums(Amount) then
                        totalSum := ADM.Amount;
                    ADMTemp.Init();
                    ADMTemp."Nutritional Type" := NutType::Proteins;
                    ADMTemp.Amount := totalSum;
                    ADMTemp."Item description" := 'The sum of proteins';
                    ADMTemp.Insert();
                    ADM.Reset();


                    ADM.SetRange("Nutritional Type", NutType::Fats);
                    totalSum := 0;
                    if ADM.CalcSums(Amount) then
                        totalSum := ADM.Amount;
                    ADMTemp.Init();
                    ADMTemp."Nutritional Type" := NutType::Fats;
                    ADMTemp.Amount := totalSum;
                    ADMTemp."Item description" := 'The sum of fats';
                    ADMTemp.Insert();
                    ADM.Reset();


                    ADM.SetRange("Nutritional Type", NutType::Sugars);
                    totalSum := 0;
                    if ADM.CalcSums(Amount) then
                        totalSum := ADM.Amount;
                    ADMTemp.Init();
                    ADMTemp."Nutritional Type" := NutType::Sugars;
                    ADMTemp.Amount := totalSum;
                    ADMTemp."Item description" := 'The sum of sugars';
                    ADMTemp.Insert();
                    ADM.SetRange("Nutritional Type", NutType::Sugars);
                    ADM.Reset();

                    Page.RunModal(50001, ADMTemp);






                end;
            }

        }

    }

    var
        myInt: Integer;
}