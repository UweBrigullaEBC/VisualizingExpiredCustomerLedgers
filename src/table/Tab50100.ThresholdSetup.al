table 50100 ThresholdSetup
{
    Caption = 'Threshold Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; PrimaryKey; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;
        }
        field(2; Threshold1Value; Integer)
        {
            Caption = 'Threshold 1 Value';
            DataClassification = CustomerContent;
        }
        field(3; Threshold2Value; Integer)
        {
            Caption = 'Threshold 2 Value';
            DataClassification = CustomerContent;
        }
        field(4; Threshold1Style; Enum StyleType)
        {
            Caption = 'Threshold 1 Style';
            DataClassification = CustomerContent;
        }
        field(5; Threshold2Style; Enum StyleType)
        {
            Caption = 'Threshold 2 Style';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; PrimaryKey)
        {
            Clustered = true;
        }
    }
}
