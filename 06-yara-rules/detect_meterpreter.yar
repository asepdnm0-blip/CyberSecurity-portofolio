rule Detect_Meterpreter_Reverse_TCP
{
    meta:
        description = "Detects Meterpreter reverse_tcp payload"
        author      = "Asep Dwi NurMaulid"
        date        = "2026-05-31"
        severity    = "High"
        reference   = "Lab analysis — payload generated with MSFvenom"

    strings:
        $mz    = { 4D 5A }
        $str1  = "metsrv" nocase
        $str2  = "ReflectiveLoader"
        $str3  = "WS2_32.dll" nocase
        $str4  = "ws2_32" nocase

    condition:
        $mz at 0 and 2 of ($str1, $str2, $str3, $str4)
}

rule Detect_Shikata_Encoded_Payload
{
    meta:
        description = "Detects shikata_ga_nai encoded payload"
        author      = "Asep DwI NurMaulid"
        date        = "2026-05-31"
        severity    = "High"

    strings:
        $mz      = { 4D 5A }
        $shikata = { D9 74 24 F4 }

    condition:
        $mz at 0 and $shikata
}
