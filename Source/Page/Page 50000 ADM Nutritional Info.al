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

                }
                field("Item description"; "Item description")
                {
                    ApplicationArea = All;
                    //FieldPropertyName = FieldPropertyValue;
                }
                field("Item description 2"; "Item description 2")
                {
                    ApplicationArea = All;
                    //FieldPropertyName = FieldPropertyValue;
                }
                field("Nutritional Type"; "Nutritional Type")
                {
                    ApplicationArea = All;
                    //FieldPropertyName = FieldPropertyValue;
                }

                field(Amount; Amount)
                {
                    ApplicationArea = All;
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
}