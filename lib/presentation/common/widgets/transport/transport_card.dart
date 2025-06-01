import 'package:flutter/material.dart';

class TransportCard extends StatefulWidget {
  final String name;
  final String emoji;
  final LinearGradient gradient;
  final bool recommended;
  final double rating;
  final int reviews;
  final int price;
  final String duration;
  final String type;
  final String typeIcon;
  final LinearGradient buttonGradient;
  final VoidCallback? onSelected;

  const TransportCard({
    super.key,
    required this.name,
    required this.emoji,
    required this.gradient,
    required this.recommended,
    required this.rating,
    required this.reviews,
    required this.price,
    required this.duration,
    required this.type,
    required this.typeIcon,
    required this.buttonGradient,
    this.onSelected,
  });

  @override
  State<TransportCard> createState() => _TransportCardState();
}

class _TransportCardState extends State<TransportCard> {
  bool _selected = false;

  void _selectTransporteur() {
    setState(() {
      _selected = true;
    });
    if (widget.onSelected != null) {
      widget.onSelected!();
    }
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Transporteur sélectionné'),
            content: Text(
              '${widget.name}\nPrix : ${widget.price} FCFA\nDurée : ${widget.duration}',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !_selected ? _selectTransporteur : null,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color:
                widget.recommended
                    ? const Color(0xFF10B981)
                    : const Color(0xFFE5E7EB),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      gradient: widget.gradient,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        widget.emoji,
                        style: const TextStyle(fontSize: 28),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Color(0xFF1F2937),
                              ),
                            ),
                            if (widget.recommended)
                              Container(
                                margin: const EdgeInsets.only(left: 8),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF10B981),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Text(
                                  'Recommandé',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Color(0xFFF59E0B),
                                  size: 18,
                                ),
                                SizedBox(width: 2),
                                Text(
                                  '${widget.rating}',
                                  style: const TextStyle(
                                    color: Color(0xFFF59E0B),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '/5 (${widget.reviews} avis)',
                                  style: const TextStyle(
                                    color: Color(0xFF6B7280),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              '${widget.price} FCFA',
                              style: const TextStyle(
                                color: Color(0xFF10B981),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              widget.duration,
                              style: const TextStyle(
                                color: Color(0xFF3B82F6),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              '${widget.typeIcon} ${widget.type}',
                              style: const TextStyle(
                                color: Color(0xFF374151),
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 1,
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                              backgroundColor:
                                  _selected
                                      ? const Color(0xFF059669)
                                      : const Color(0xFFE0E0E0),
                              foregroundColor:
                                  _selected ? Colors.white : Colors.black87,
                            ),
                            onPressed: !_selected ? _selectTransporteur : null,
                            child:
                                _selected
                                    ? const Text('Sélectionné ✓')
                                    : const Text('Choisir ce transporteur'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
