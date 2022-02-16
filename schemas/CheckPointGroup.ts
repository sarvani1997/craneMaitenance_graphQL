import { list } from "@keystone-6/core";
import { text, password, relationship } from "@keystone-6/core/fields";

export const CheckPointGroup = list({
  fields: {
    name: text(),
    checkPoints: relationship({
      ref: "CheckPoint.checkPointGroup",
      many: true,
    }),
  },
});
