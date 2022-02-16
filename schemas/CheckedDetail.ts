import { list } from "@keystone-6/core";
import {
  text,
  password,
  relationship,
  integer,
  checkbox,
  timestamp,
} from "@keystone-6/core/fields";

export const CheckedDetail = list({
  fields: {
    date: timestamp(),
    readingMain: integer(),
    readingGen: integer(),
    worksDone: text(),
    check: relationship({ ref: "Check", many: false }),
    checkPoints: relationship({ ref: "CheckPoint", many: true }),
    user: relationship({ ref: "User", many: false }),
    equipment: relationship({ ref: "CraneEquipment", many: false }),
  },
});
