codeunit 61190 "PTESalesOrderRegister Mgt"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CDC Capture Engine", 'OnBeforeValidateDocument', '', false, false)]
    local procedure CDCCaptureEngine_BeforeValidate(var Document: Record "CDC Document"; var IsHandled: Boolean)
    begin
        if Document."Source Record ID Tree ID" = 0 then
            exit;

        // Validates the document with standard functionality
        Document.ValidateDocument();

        // Register document
        IsHandled := Document.RegisterHideErrors();
    end;
}
