# Operating Model Segmentation

## Purpose

Segment the operating model deliberately so different business domains,
channels, geographies, or service types can run with distinct control,
ownership, and delivery expectations where uniformity would be counterproductive.

## When To Use

- one operating model does not fit every business segment
- architecture choices differ materially across products, channels, or regions
- delivery and governance need clarity on where consistency ends and variation
  begins

## When Not To Use

- segmentation would add complexity without changing meaningful decisions
- the organization is too small or uniform for separate operating modes to add
  value

## Assumptions

- segment boundaries can be defined clearly
- governance and ownership can support different segment expectations
- the segmentation will influence architecture or delivery decisions

## Key Components

- segment definitions and rationale
- differentiated controls, ownership, or service expectations
- shared versus segment-specific capabilities
- architecture implications for each segment

## Benefits

- reduces forced uniformity where different contexts need different models
- improves fit between architecture and business reality
- supports clearer governance of variation

## Tradeoffs

- adds complexity to governance and delivery
- can create duplication if boundaries are weak
- requires disciplined communication about shared versus distinct models

## Common Risks

- segmentation driven by organization politics rather than real need
- too many segments creating fragmentation
- unclear boundaries between common services and segment-specific behavior

## Related Templates

- `organization`
- `business-capability`
- `architecture-vision`
- `initiative`
- `roadmap`
