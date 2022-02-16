import { list } from "@keystone-6/core";
import { text, password, relationship } from "@keystone-6/core/fields";

export const CheckPoint = list({
  fields: {
    name: text(),
    checkPointGroup: relationship({
      ref: "CheckPointGroup.checkPoints",
      many: false,
    }),
  },
});
