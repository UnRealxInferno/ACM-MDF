class ACM_Medication {
    class Medications {
        class ACM_PO_Medication;

        class Moxifloxacin: ACM_PO_Medication {
            medicationType    = "Moxifloxacin";
            timeInSystem      = 7200;
            timeTillMaxEffect = 3600;
            maxEffectTime     = 2400;
            maxDose           = 0;
            maxDoseDeviation  = 0;
            maxPainReduce     = 0;
            painReduce        = 0;
            viscosityChange   = 0;
            weightEffect      = 1;
        };
    };

    class MedicationType {
        class Moxifloxacin {
            classnames[] = {"Moxifloxacin"};
        };
    };

    class Concentration {
        class Moxifloxacin {
            concentration = 400;
            dose          = "400mg";
            volume        = 1;
        };
    };
};
