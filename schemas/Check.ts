import { list } from "@keystone-6/core";
import {
  text,
  password,
  relationship,
  integer,
  checkbox,
} from "@keystone-6/core/fields";

export const Check = list({
  fields: {
    name: text({ validation: { isRequired: true } }),
    checkHours: integer(),
    checkDays: integer(),
    shutdownRequired: checkbox(),
    checkPoints: relationship({ ref: "CheckPoint", many: true }),
  },
});
