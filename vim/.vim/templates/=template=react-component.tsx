/*
 * %FFILE%
 * Copyright (C) %YEAR% %USER% <%MAIL%>
 *
 * Distributed under terms of the %LICENSE% license.
 */

import React from "react";

interface Props {
  example: string;
}

export const %FILE%: React.FC<Props> = ({ example }) => (
  %HERE%
  <h1>Hello from {example}!</h1>
);
