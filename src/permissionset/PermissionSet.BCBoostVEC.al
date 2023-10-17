permissionset 50100 "BCBoost VEC Super"
{
    Assignable = true;
    Caption = 'BCBoost VEC Super', MaxLength = 30;
    Permissions =
        table ThresholdSetup = X,
        tabledata ThresholdSetup = RMID,
        codeunit ThresholdSetupManagement = X,
        page ThresholdSetup = X;
}
