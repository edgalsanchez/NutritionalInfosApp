table 50000 "ADM Nutritional Information"
{
    DataClassification = CustomerContent;
    Caption = 'Nutritional Informations';

    fields
    {
        field(1; "Item No."; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Item No.';
            TableRelation = item."No.";
        }

        field(20; "Item description"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Item description';
            trigger OnValidate()
            var
                item: Record Item;
            begin
                item.Get(Rec."Item No.");
                Rec."Item description" := item.Description;
                rec.Modify();
            end;
        }

        field(30; "Item Description 2"; Text[50])
        {
            //DataClassification = ;
            Caption = 'Item Description 2';
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Description 2" where("No." = field("Item No.")));
            Editable = false;

        }

        field(40; "Nutritional Type"; Enum "ADM Nutritional Info Type")
        {
            DataClassification = ToBeClassified;
        }

        field(50; "Amount"; Decimal)
        {
            Caption = 'Amount';

        }

    }


    keys
    {
        key(PK; "Item No.", "Nutritional Type")
        {
            Clustered = true;
        }
    }


    // trigger OnInsert()
    // var
    //     maxAmount: Integer;
    //     ADM: Record "ADM Nutritional Information";
    // begin
    //     maxAmount := 0;
    //     ADM.SetRange("Item No.", Rec."Item No.");
    //     if ADM.CalcSums(Amount) then
    //         maxAmount := Rec.Amount + ADM.Amount;
    //     if maxAmount >= 2000 then
    //         Error('Te sum of the calories');


    // end;

    // trigger OnModify()
    // var
    //     maxAmount: Integer;
    //     ADM: Record "ADM Nutritional Information";
    // begin
    //     maxAmount := 0;
    //     ADM.SetRange("Item No.", Rec."Item No.");
    //     if ADM.CalcSums(Amount) then
    //         maxAmount := Rec.Amount + ADM.Amount;
    //     if maxAmount >= 2000 then
    //         Error('Te sum of the calories');


    // end;


}