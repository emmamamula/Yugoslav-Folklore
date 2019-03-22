<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:pattern>
        <sch:rule context="poem">
            <sch:assert test="(2*distinct-values(//speech/@ref))= count(//speech/@ref)">
                There's a screw-up in the speech refs
            </sch:assert>
            <sch:assert test="(2*distinct-values(//action/@ref))= count(//action/@ref)">
                There's a screw-up in the action refs
            </sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>