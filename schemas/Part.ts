import { list } from "@keystone-6/core";
import { text, password, relationship } from "@keystone-6/core/fields";

export const Part = list({
  fields: {
    name: text(),
  },
});
