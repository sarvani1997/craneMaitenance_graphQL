/*
Welcome to Keystone! This file is what keystone uses to start the app.

It looks at the default export, and expects a Keystone config object.

You can find all the config options in our docs here: https://keystonejs.com/docs/apis/config
*/
import { User } from "./schemas/User";
import { CraneEquipment } from "./schemas/CraneEquipment";
import { Check } from "./schemas/Check";
import { CheckPointGroup } from "./schemas/CheckPointGroup";
import { CheckPoint } from "./schemas/CheckPoint";
import { Part } from "./schemas/Part";
import { CheckedDetail } from "./schemas/CheckedDetail";

import { config } from "@keystone-6/core";

// Look in the schema file for how we define our lists, and how users interact with them through graphql or the Admin UI
import { lists } from "./schema";

// Keystone auth is configured separately - check out the basic auth setup we are importing from our auth file.
import { withAuth, session } from "./auth";
import "dotenv/config";

export default withAuth(
  // Using the config function helps typescript guide you to the available options.
  config({
    server: {
      cors: {
        origin: [process.env.FRONTEND_URL],
        credentials: true,
      },
    },
    // the db sets the database provider - we're using sqlite for the fastest startup experience
    db: {
      provider: "sqlite",
      url: "file:./keystone.db",
      async onConnect(context) {
        console.log("connected to the database");
      },
      idField: { kind: "autoincrement" },
      enableLogging: true,
      useMigrations: true,
    },
    // This config allows us to set up features of the Admin UI https://keystonejs.com/docs/apis/config#ui
    ui: {
      // For our starter, we check that someone has session data before letting them see the Admin UI.
      isAccessAllowed: (context) => !!context.session?.data,
    },
    lists: {
      User,
      CraneEquipment,
      Check,
      CheckPointGroup,
      CheckPoint,
      Part,
      CheckedDetail,
    },
    session,
  })
);
