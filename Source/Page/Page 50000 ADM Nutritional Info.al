page 50000 "ADM Nutritional Informations"
{
    Caption = 'Nutritional Infos';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "ADM Nutritional Information";


    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Item No."; "Item No.")
                {
                    ApplicationArea = All;
                    StyleExpr = textExpression;

                }
                field("Item description"; "Item description")
                {
                    ApplicationArea = All;
                    StyleExpr = textExpression;
                    //FieldPropertyName = FieldPropertyValue;
                }
                field("Item description 2"; "Item description 2")
                {
                    ApplicationArea = All;
                    StyleExpr = textExpression;
                    //FieldPropertyName = FieldPropertyValue;
                }
                field("Nutritional Type"; "Nutritional Type")
                {
                    ApplicationArea = All;
                    StyleExpr = textExpression;
                    //FieldPropertyName = FieldPropertyValue;
                }

                field(Amount; Amount)
                {
                    ApplicationArea = All;
                    StyleExpr = textExpression;
                    //FieldPropertyName = FieldPropertyValue;
                }

            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
    trigger OnAfterGetRecord()
    var


    begin
        if Rec.Amount < 10 then
            textExpression := 'Standard';
        if (Rec.Amount >= 10) and (Rec.Amount < 100) then
            textExpression := 'Favorable';
        if Rec.Amount >= 100 then
            textExpression := 'Attention';

    end;


    var
        textExpression: Text;
}