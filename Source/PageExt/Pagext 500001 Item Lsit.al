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

        }

    }

    var
        myInt: Integer;
}