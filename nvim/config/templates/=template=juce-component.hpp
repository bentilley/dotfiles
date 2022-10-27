/*
 * %FFILE%
 * Copyright (C) %YEAR% %USER% <%MAIL%>
 *
 * Distributed under terms of the %LICENSE% license.
 */

#pragma once

#include "../JuceLibraryCode/JuceHeader.h"

class %CLASS% : public Component {
public:
  %CLASS%();
  ~%CLASS%();

  void paint(Graphics &) override;
  void resized() override;

private:
  String currentSizeAsString;
  %HERE%

  JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR(%CLASS%)
};
