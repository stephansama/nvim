#!/usr/bin/env node

import * as fsp from "node:fs/promises";
import { z } from "zod";
import { languagePackSchema } from "../lua/lang/schema.ts";

await fsp.writeFile(
	"./lua/lang/schema.json",
	JSON.stringify(z.toJSONSchema(languagePackSchema)),
);
