namespace riskmanagement;
    using { managed } from '@sap/cds/common';


entity Risks : managed {
    key ID : UUID@(Core.Computed : true);
    title : String(10);
    owner : String;
    prio_code : String(5);
    descr : String;
    miti : Association to Mitigations;
    impact : Integer;     
    bp : Association to BusinessPartners;
    criticality : Integer;
}

entity Mitigations : managed {
    key ID : UUID@(Core.Computed : true);
    owner : String;
    descr : String;
    timeline : String;
    risks : Association to many Risks on risks.miti = $self;
}

using { API_BUSINESS_PARTNER as external} from  '../srv/external/API_BUSINESS_PARTNER';

entity BusinessPartners as projection on external.A_BusinessPartner{
    key BusinessPartner,
    BusinessPartnerFullName as FullName,
}