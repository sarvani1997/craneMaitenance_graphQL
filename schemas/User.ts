import { list } from "@keystone-6/core";
import { text, password, relationship } from "@keystone-6/core/fields";

export const User = list({
  fields: {
    name: text({ validation: { isRequired: true } }),
    password: password(),
    phone: text({ validation: { isRequired: true }, isIndexed: "unique" }),
    role: text(),
  },
});
