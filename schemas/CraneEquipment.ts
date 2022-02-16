import { list } from "@keystone-6/core";
import { text, password, relationship } from "@keystone-6/core/fields";

export const CraneEquipment = list({
  fields: {
    name: text({ validation: { isRequired: true } }),

    type: text(),
  },
});
