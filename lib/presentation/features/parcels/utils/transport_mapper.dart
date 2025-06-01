import 'package:benin_express/domain/models/parcel.dart';
import 'package:benin_express/domain/models/transport_type.dart';
import 'package:benin_express/presentation/features/parcels/models/transport_option.dart';

/// Utilitaire pour convertir entre les types d'options de transport
class TransportMapper {
  /// Convertit une TransportOption en TransportType pour le modé8le Parcel
  static TransportType mapToTransportType(TransportOption option) {
    switch (option.name) {
      case 'Transport Express':
        return TransportType.express;
      case 'Transport Standard':
        return TransportType.standard;
      case 'Transport u00c9conomique':
        return TransportType.economic;
      default:
        return TransportType.standard; // Valeur par dé9faut
    }
  }

  /// Cré9e un Parcel avec l'option de transport sé9lectionné9e
  static Parcel createParcelWithTransport(
    Parcel baseParcel,
    TransportOption selectedOption,
  ) {
    return Parcel(
      id: baseParcel.id,
      trackingNumber: baseParcel.trackingNumber,
      status: baseParcel.status,
      description: baseParcel.description,
      createdAt: baseParcel.createdAt,
      updatedAt: baseParcel.updatedAt,
      estimatedDelivery: baseParcel.estimatedDelivery,
      pickupAddress: baseParcel.pickupAddress,
      deliveryAddress: baseParcel.deliveryAddress,
      sender: baseParcel.sender,
      recipient: baseParcel.recipient,
      weight: baseParcel.weight,
      dimensions: baseParcel.dimensions,
      price: selectedOption.price.toDouble(),
      transportType: mapToTransportType(selectedOption),
      history: baseParcel.history,
    );
  }
}
