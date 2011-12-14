﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Connects.Profiles.Service.DataContracts
{
    [System.Xml.Serialization.XmlTypeAttribute()]
    [System.SerializableAttribute()]
    public class AffiliationListPerson
    {
        private bool visibleField;
        private List<AffiliationPerson> affiliationField;

        [System.Xml.Serialization.XmlAttributeAttribute()]
        //[DataMember(IsRequired = false, Name = "Visible", Order = 0)]
        public bool Visible
        {
            get
            {
                return this.visibleField;
            }
            set
            {
                this.visibleField = value;
            }
        }

        [System.Xml.Serialization.XmlElementAttribute("Affiliation")]
        public List<AffiliationPerson> Affiliation
        {
            get
            {
                return this.affiliationField;
            }
            set
            {
                this.affiliationField = value;
            }
        }


    }
}
