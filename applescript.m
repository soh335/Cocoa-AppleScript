#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

#import <Foundation/Foundation.h>

XS(xs_RunAppleScript) {
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
    }
    else
    {
        Perl_croak(aTHX_ "%s\n", [[errorDict objectForKey: @"NSAppleScriptErrorMessage"] UTF8String]);
    }

    [pool drain];

    XSRETURN(0);
}

XS(boot_Cocoa__AppleScript) {
    newXS("Cocoa::AppleScript::xs_RunAppleScript", xs_RunAppleScript, __FILE__);
}
