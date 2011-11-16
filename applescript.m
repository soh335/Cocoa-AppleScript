#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

#import <Foundation/Foundation.h>

XS(RunAppleScript) {
    dXSARGS;

    NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];

    SV* sv_Script = ST(0);
    STRLEN len;
    char* c = SvPV(sv_Script, len);
    NSString* script = [NSString stringWithUTF8String:c];

    NSDictionary* errorDict;
    NSAppleEventDescriptor* returnDescriptor = NULL;
    NSAppleScript* scriptObject = [[NSAppleScript alloc] initWithSource:script];

    returnDescriptor = [scriptObject executeAndReturnError: &errorDict];
    [scriptObject release];

    if (returnDescriptor != NULL)
    {
        //SV* sv_Res = sv_2mortal(newSV(0));
        //sv_setpv(sv_Res, [[[returnDescriptor descriptorForKeyword:'seld'] stringValue] UTF8String]);
        //ST(0) = sv_Res;
    }
    else
    {
        Perl_croak(aTHX_ "%s\n", [[errorDict objectForKey: @"NSAppleScriptErrorMessage"] UTF8String]);
    }

    [pool drain];

    XSRETURN(0);
}

XS(boot_Cocoa__AppleScript) {
    newXS("Cocoa::AppleScript::RunAppleScript", RunAppleScript, __FILE__);
}
